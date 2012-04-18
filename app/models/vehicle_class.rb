class VehicleClass < ActiveRecord::Base
  has_many :entrants, :include => :trap_speeds
  belongs_to :event
  
  validates :name, :uniqueness => { :scope => [:event_id] }
  
  def print_name
    #return "#{self.name} : #{self.max_speed} MPH" if self.name !~ /MPH/ and self.max_speed !=nil and self.max_speed > 0
    return self.name
  end
end
