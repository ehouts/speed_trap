class Entrant < ActiveRecord::Base
  belongs_to :vehicle_class
  belongs_to :event
  has_many :trap_speeds
  
  validates :number, :presence => true, :uniqueness => { :scope => [:event_id] }

end
