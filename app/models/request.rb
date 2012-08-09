class Request < ActiveRecord::Base
  
  has_many :analyses, :dependent => :destroy
  has_many :targets, :through => :analyses
  has_many :assays, :through => :analyses
  has_many :tasks, :dependent => :destroy
  
  attr_accessible :identifier, :description, :due_date, :target_ids, :state, :analyses_attributes
  accepts_nested_attributes_for :analyses

  validates :due_date, :presence => true
  validates :identifier, :presence => true, :length => { :maximum => 50 }
  validates :description, :presence => true, :length => { :maximum => 100 }  
  validates :target_ids, :presence => true, :on => :update
  validates :state, :presence => true, :length => { :maximum => 50 }  
  validates_each :analyses do |record, attr|
    record.analyses.each do |analysis|
      unless analysis.assay_id? || analysis.target.assays.empty?
        record.errors.add attr, I18n.t('requests.errors.empty_assays') 
        break
      end
    end
  end
  
  default_scope :order => :due_date
  scope :tagged_with, lambda { |tags| joins(:analyses).where('analyses.target_id' => Target.tagged_with(tags)) }
  scope :in_state, lambda { |*states| where(:state => states) }
  
  def assign_uncompleted_tasks_to(user)
    tasks.uncompleted.each { |task| task.assign_to user }
  end
  
  def create_secondary_analyses
    secondary_analyses.each do |sa|
      Analysis.create!(:request_id => self.id, :assay_id => sa[:assay_id], :target_id => sa[:target_id], :secondary => true)
    end
  end
  
  def secondary_analyses
    assays.inject [] do |assay_targets, assay|        
      elems = assay.targets.map do |target|         
        if Analysis.where(:request_id => self.id, :assay_id => assay.id, :target_id => target.id).empty?
          { :assay_id => assay.id, :target_id => target.id } 
        end
      end
      assay_targets.concat elems.compact
    end
  end

  private
  
  state_machine :state, :initial => :pending do
    
    event :start do
      transition :pending => :review
    end
    
    event :accept do
      transition :review => :prepare
    end
    
    event :reject do
      transition :review => :rejected
    end
    
    event :prepared do
      transition :prepare => :analyse
    end
    
    state all - :pending do
      
      def complete_open_tasks(transition)
        tasks.uncompleted.each { |t| t.complete }
      end
      
      def create_task(transition)
        Task.create!(:description => "#{transition.to}_#{self.class.name}".downcase, :request_id => self.id, :assignee => assignee_of_last_completed_task)
      end
      
      def assignee_of_last_completed_task
        last_completed_task = Task.completed.where(:request_id => self.id).first
        if last_completed_task
          last_completed_task.assignee 
        else 
          nil
        end
      end

    end
    
    before_transition (any - :pending) => any, :do => :complete_open_tasks
    
    after_transition any => (any - [:pending, :rejected]), :do => :create_task
    
    after_transition any => :prepare, :do => :create_secondary_analyses
    
  end
  
end
