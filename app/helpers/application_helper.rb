module ApplicationHelper

  private
    def event_selected?
      ss = SystemSetting.first
      if ss != nil and ss.event_id != nil and ss.event.name != nil
        return true
      end
      flash[:notice] = "A valid Event must be selected first"
      redirect_to root_url
      return false
    end
    
    def current_event
      ss = SystemSetting.first
      if ss != nil and ss.event_id != nil and ss.event.name != nil
        return ss.event
      end
	  return nil
    end
end
