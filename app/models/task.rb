class Task < ActiveRecord::Base
  
  belongs_to :assignee, :class_name => 'User', :foreign_key => :assignee
  belongs_to :request
  attr_accessible :description, :assignee, :completed, :request_id
  
  validates :description, :presence => true, :length => { :maximum => 255 }
  
  scope :by_request_date, :joins => :request, :order => 'requests.due_date'
  scope :uncompleted, where(:completed => false)
  scope :completed, where(:completed => true)  
  scope :assigned_to, lambda { |assignee| where(:assignee => assignee) }
  scope :unassigned, where(:assignee => nil)  
  scope :tagged_with, lambda { |tags| where(:request_id => Request.tagged_with(tags)) }
  scope :with_request_in_state, lambda { |state| joins(:request).where('requests.state' => state)}
  
  def assign_to(assignee) 
    self.assignee = assignee
    self.save
  end
  
  def complete
    self.completed = true
    self.save
  end
  
end
