class Event < ActiveRecord::Base
  has_many :entrants
  has_many :stations
  has_many :system_settings
  has_many :trap_speeds
  has_many :vehicle_classes
  
  validates :name, :uniqueness => { :case_sensitive => false }

end
