class Entrant < ActiveRecord::Base
  belongs_to :vehicle_class
  belongs_to :event
  has_many :trap_speeds
  
  validates :number, :presence => true, :uniqueness => { :scope => [:event_id] }

  # returns a nicely formatted combination of #, name and vehicle info
  def entrant_string
	return String.new if self.number == nil
	entrant_data = self.number
	entrant_data += " - #{self.name}" if self.name != nil and self.name.length > 0
	entrant_data += " #{self.vehicle_make}" if self.vehicle_make != nil and self.vehicle_make.length > 0
	entrant_data += " #{self.vehicle_model}" if self.vehicle_model != nil and self.vehicle_model.length > 0
	return entrant_data
  end

  def top_speed
	best_run = self.trap_speeds.find(:first, :conditions => "speed <= #{self.vehicle_class.max_speed.to_f}", :order => "speed DESC", :limit => 1)
	return nil if best_run == nil
	return best_run.speed
  end
  
  def eligible_for_speed_award?
	return true if ! self.past_award_speed and self.top_speed != nil and self.top_speed > self.event.award_speed
	return false
  end
end
