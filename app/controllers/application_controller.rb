class ApplicationController < ActionController::Base
  protect_from_forgery
  has_mobile_fu
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied."
    redirect_to :new_user_session
  end
  
  private
  
  def user_session
    @user_session ||= UserSession.new(session)
  end
  helper_method :user_session
end
