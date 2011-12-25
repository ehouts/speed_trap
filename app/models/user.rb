class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :user_level

  attr_accessible :username
  
  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  attr_accessor :login
  attr_accessible :login
  
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    login = conditions.delete(:login)
    where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.strip.downcase }]).first
  end
  
  
  def authorized? action
    #return true if self.user_type.user_level == 0 # admin can do anything
    #return true if action == :show_users and self.user_type.user_level < 50
    return true if action == :edit_entrants and self.user_level < 30
    return true if action == :edit_types and self.user_level < 10
    return true if action == :data_entry and self.user_level < 10
    return true if action == :edit_events and self.user_level < 10
    return true if action == :display_events and self.user_level <= 99
    return true if action == :edit_stations and self.user_level < 10
    return true if action == :edit_trap_speeds and self.user_level < 10
    return true if action == :edit_vehicle_classes and self.user_level < 10

    return true if action == :edit_system_settings and self.user_level < 30
    #return true if action == :edit_users and self.user_type.user_level <= 10
    #return true if action == :edit_test_racks and self.user_type.user_level <= 10
    #return true if action == :edit_test_bays and self.user_type.user_level <= 10
    #return true if action == :edit_hardware and self.user_type.user_level <= 10
    #return true if action == :not_guest and self.user_type.user_level < 99
    #return true if action == :run_tests and self.user_type.user_level <= 50
    #return true if action == :edit_settings and self.user_type.user_level <= 50
    #
    #return false
    return false
  end
end
