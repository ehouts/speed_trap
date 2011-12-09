class User < ActiveRecord::Base
  belongs_to :user_type
  has_secure_password
  
  attr_accessible :name, :email, :password, :password_confirmation
  
  validates_presence_of :name
  validates_uniqueness_of :name
  
  def self.authenticate(name, password)
    find_by_name(name).try(:authenticate, password)
  end
end


