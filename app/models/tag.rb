class Tag < ActiveRecord::Base

  attr_accessible :name, :category, :description
  has_many :target_tags
  has_many :targets, :through => :target_tags
  attr_accessor :count
  
  validates :name, :presence => true, :length => { :maximum => 50 }, :uniqueness => true
  validates :category, :length => { :maximum => 50 }
  validates :description, :length => { :maximum => 255 }
  
  default_scope :order => :name
  scope :named, lambda { |*names| where(:name => names) }
  scope :for_targets, lambda { |targets| joins(:target_tags).where('target_tags.target_id' => targets) }
  scope :with_targets, joins(:target_tags).group('target_tags.tag_id')

  def self.for_analyses(assigned_to_assay = true)
    rel = Tag.
      joins('INNER JOIN target_tags ON target_tags.tag_id = tags.id').
      joins('INNER JOIN targets ON target_tags.target_id = targets.id').
      joins('INNER JOIN analyses ON targets.id = analyses.target_id')
    rel = rel.where('analyses.assay_id IS NOT NULL') if assigned_to_assay
    rel.group('tags.id')
  end

  def self.for_requests
    for_analyses(false).joins('INNER JOIN requests ON analyses.request_id = requests.id')
  end

  def self.for_tasks(assignee = nil)
    rel = for_requests.joins('INNER JOIN tasks ON requests.id = tasks.request_id')
    rel = rel.where('tasks.assignee' => assignee) if assignee
    rel
  end

end
