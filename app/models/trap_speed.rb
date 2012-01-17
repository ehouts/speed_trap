class TrapSpeed < ActiveRecord::Base
  belongs_to :event
  belongs_to :station
  belongs_to :entrant, :include => :vehicle_class
  
  
  
  def capture_time_to_timestamp
    Time.at(self.capture_time.to_i).strftime("%D %I:%M:%S %p")
  end

  def capture_time_to_short_timestamp
    Time.at(self.capture_time.to_i).strftime("%m/%d %I:%M:%S %p")
  end

  def show_speed(current_user)
	if self.speed == nil
	  return "INVALID"
	end
#logger.info "speed = #{self.speed}, max = #{self.entrant.vehicle_class.max_speed}"
	if self.speed > self.entrant.vehicle_class.max_speed.to_f or self.force_dnf
	  if current_user != nil and current_user.authorized?(:data_entry)
		return "DNF : #{self.speed}"
	  end
	  return "DNF"
	end
	return self.speed
  end

end
