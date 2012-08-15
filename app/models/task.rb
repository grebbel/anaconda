class Task < ActiveRecord::Base
  
  belongs_to :assignee, :class_name => 'User', :foreign_key => :assignee
  belongs_to :request
  attr_accessible :description, :assignee, :completed, :request_id
  
  validates :description, :presence => true, :length => { :maximum => 255 }
  
  scope :uncompleted, where(:completed => false)
  scope :completed, where(:completed => true)  
  scope :assigned_to, lambda { |assignee| where(:assignee => assignee) }
  scope :unassigned, where(:assignee => nil)  
  scope :tagged, lambda { |*tags| 
    joins("
      INNER JOIN requests ON tasks.request_id = requests.id
      INNER JOIN analyses ON requests.id = analyses.request_id
      INNER JOIN targets ON analyses.target_id = targets.id
      INNER JOIN target_tags ON targets.id = target_tags.target_id
      INNER JOIN tags ON target_tags.tag_id = tags.id
      ").
    where('tags.name' => tags).
    order('requests.due_date')
  }
  scope :by_request_date, :joins => :request, :order => 'requests.due_date'
  scope :with_request_in_state, lambda { |state| joins(:request).where('requests.state' => state)}
  scope :tagged_with, lambda { |tags| where(:request_id => Request.tagged_with(tags)) }
  
  def assign_to(assignee) 
    self.assignee = assignee
    self.save
  end
  
  def complete
    self.completed = true
    self.save
  end
  
end
