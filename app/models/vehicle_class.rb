class VehicleClass < ActiveRecord::Base
  has_many :entrants
  
  validates :name, :uniqueness => { :scope => [:event_id] }
  
end
