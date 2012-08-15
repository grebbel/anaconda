class Target < ActiveRecord::Base
  
  has_many :codes, :class_name => 'TargetCode', :dependent => :destroy
  has_many :target_tags
  has_many :tags, :through => :target_tags, :order => :name
  has_many :assay_targets
  has_many :assays, :through => :assay_targets
  has_many :analyses
  has_many :requests, :through => :analyses
  belongs_to :type, :class_name => 'TargetType'
  belongs_to :color

  attr_accessible :name, :description, :tag_ids, :codes_attributes, :type_id, :color_id
  accepts_nested_attributes_for :codes, :reject_if => lambda { |c| c[:code].blank? }, :allow_destroy => true  
  
  validates :name, :presence => true, :uniqueness => true  
  
  default_scope :order => :name  
  scope :tagged, lambda { |*tags| 
    joins("
      INNER JOIN target_tags ON targets.id = target_tags.target_id
      INNER JOIN tags ON target_tags.tag_id = tags.id
      ").where('tags.name' => tags)    
  }  
  scope :tagged_with, lambda { |tags| joins(:target_tags).where('target_tags.tag_id' => tags) }
  scope :for_requests, lambda { |requests| joins(:analyses).where('analyses.request_id' => requests) }
  scope :with_requests, joins(:analyses)
  
end
