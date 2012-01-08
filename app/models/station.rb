class Station < ActiveRecord::Base
 belongs_to :event
 has_many :trap_speeds
 
 validates :name, :uniqueness => { :scope => [:event_id] }

  # orders data.  Orders data in the trap, and marks dups.
  def order_data trap_speed
	TrapSpeed.uncached do 
	  ss = SystemSetting.first
	  # First, find all data for this Station that is near this trap time
	  min_time = trap_speed.capture_time - ss.min_time_diff
	  max_time = trap_speed.capture_time + ss.min_time_diff
	  near_trap_speeds = self.trap_speeds.find(:all, :conditions => "capture_time < #{max_time} AND capture_time > #{min_time} AND invalid_flag = 0")
	  logger.info "found #{near_trap_speeds.length} 'near' speeds"
	  
	  # if there's already an official time, mark the new one as dup
	  near_trap_speeds.each do |t|
		if t.official_flag and t != trap_speed
		  trap_speed.dup_flag = true
		  trap_speed.save
		  return
		end
	  end
  
	  first = true
	  # mark the first as not dup, any others as dup
	  near_trap_speeds.sort { |a,b| a.capture_time <=> b.capture_time }.each do |t|
		if first
		  if t.dup_flag and ! 
			t.dup_flag = false
			t.save
		  end
		  first = false
		  next
		end
		if ! t.dup_flag
		  t.dup_flag = true
		  t.save
		end
	  end
	end
  end

end
