class ApplicationController < ActionController::Base
 MAX_SESSION_TIME = 60 * 60
  protect_from_forgery
    protected
  def confirm_logged_in
  unless session[:user_id]
  flash[:notice]= "please login"
  redirect_to(:controller => 'access', :action => 'login')
  return false #
  else 
  return true
end
end

   def prepare_session
  

   if !session[:expiry_time].nil? and session[:expiry_time] < Time.now
      # Session has expired. Clear the current session.
      reset_session
   end

   # Assign a new expiry time, whether the session has expired or not.
   session[:expiry_time] = MAX_SESSION_TIME.seconds.from_now
   return true
end
end
