module ApplicationHelper

  private
    def event_selected?
      if current_event != nil
        return true
      end
      flash[:notice] = "A valid Event must be selected first"
      redirect_to root_url
      return false
    end
    
    def current_event
	  ss = system_setting
      if ss != nil and ss.event_id != nil and ss.event.name != nil
        return ss.event
      end
	  return nil
    end
    
    def system_setting
	  SystemSetting.first
    end
    
    def event_entrants
	  return nil if ! event_selected?
	  Entrant.find(:all, "event_id = #{current_event.id}",
					:order => "number ASC")
    end


end

