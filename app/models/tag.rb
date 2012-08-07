class Tag < ActiveRecord::Base
  
  attr_accessible :name, :category, :description
  has_many :target_tags
  has_many :targets, :through => :target_tags
  
  validates :name, :presence => true, :length => { :maximum => 50 }, :uniqueness => true
  validates :category, :length => { :maximum => 50 }
  validates :description, :length => { :maximum => 255 }
  
  default_scope :order => :name
  scope :named, lambda { |*names| where(:name => names) }
  scope :for_targets, lambda { |targets| joins(:target_tags).where('target_tags.target_id' => targets) }
  scope :with_targets, joins(:target_tags).group('target_tags.tag_id')

end
