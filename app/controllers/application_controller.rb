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
      ss = SystemSetting.first
      if ss != nil and ss.event_id != nil and ss.event.name != nil
        return true
      end
      flash[:notice] = "A valid Event must be selected first"
      redirect_to root_url
      return false
    end
    
    def current_event
      return SystemSetting.first
    end
end
