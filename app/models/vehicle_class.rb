class VehicleClass < ActiveRecord::Base
  has_many :entrants
  belongs_to :event
  
  validates :name, :uniqueness => { :scope => [:event_id] }
  
  def print_name
    return "#{self.name} : #{self.max_speed} MPH" if self.name !~ /MPH/
    return self.name
  end
end
