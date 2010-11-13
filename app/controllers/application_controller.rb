class ApplicationController < ActionController::Base
  protect_from_forgery
  has_mobile_fu
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied."
    redirect_to :new_user_session
  end
  
  private
end
