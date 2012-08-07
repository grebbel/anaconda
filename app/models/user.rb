class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :rememberable
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :prefix
  
  scope :everyone_but, lambda { |*users| where('users.id not in (?)', users.find_all { |user| user.id if user }) }
  
  def display_name
    if first_name.present? || last_name.present?
      "#{first_name} #{prefix} #{last_name}" 
    else
      email
    end
  end
  
end
