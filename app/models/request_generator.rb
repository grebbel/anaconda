class RequestGenerator
  include ActiveAttr::Model
  include Faker
    
  attribute :count, :type => Integer, :default => 10
  attribute :max_days, :type => Integer, :default => 7
  attribute :min_targets, :type => Integer, :default => 1
  attribute :max_targets, :type => Integer, :default => 5
  attribute :assign_to_current_user, :type => Boolean, :default => true
  
  validates :count, :presence => true, :numericality => { :greater_than => 0 }
  validates :max_days, :presence => true, :numericality => { :greater_than => 0 }
  validates :min_targets, :presence => true, :numericality => { :greater_than => 0 }
  validates :max_targets, :presence => true, :numericality => { :greater_than => 0 }
  
  def generate_requests(options = { })
    raise ScriptError, 'Invalid' if invalid?
    options = { :base_id => 120000000, :save => false }.merge(options)
    all_targets = Target.all
    requests = [ ]
    count.times do      
      identifier = options[:base_id] + rand(100000)
      due_date = Time.now + (1 + rand(max_days)).days;
      targets = all_targets.sample([min_targets + rand(max_targets), max_targets].min)
      params = {:identifier => identifier, :description => random_description, :due_date => due_date, :target_ids => targets.map { |t| t.id }};
      request = Request.new(params)
      request.start unless options[:disable_start]
      requests << request
    end    
    requests
  end
  
  private
  
  def random_description
    number = rand(9000000 + 1000000) + 1000000
    birth_date = "#{rand(28-1)+1}-#{rand(12-1)+1}-#{rand(60)+1940}"
    name = "#{Name.last_name()}, #{Name.first_name().slice(0)}"
    gender =%w(M V).sample();
    "#{number} #{name} (#{gender}), #{birth_date}"
  end
  
  
end