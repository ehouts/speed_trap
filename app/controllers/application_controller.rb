class ApplicationController < ActionController::Base
  protect_from_forgery

  private
    def user_authorized? task
      if current_user != nil and current_user.username != nil and current_user.authorized?(task)
        return true
      end
      flash[:notice] = "You have insufficient privileges to access this page"
      redirect_to root_url
      return false
    end
    
    def event_selected?
      if system_setting != nil and system_setting.event_id != nil and system_setting.event.name != nil
        return true
      end
      flash[:notice] = "A valid Event must be selected first"
      redirect_to root_url
      return false
    end

    def current_event
      if system_setting != nil and system_setting.event_id != nil and system_setting.event.name != nil
        return system_setting.event
      end
	  return nil
    end
    
    def system_setting
      SystemSetting.first
    end
end
