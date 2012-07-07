class ApplicationController < ActionController::Base
  include Clearance::Authentication
  protect_from_forgery
  before_filter :authorize
  #check_authorization :unless => :session_controller?
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  def authenticate(params)
    User.authenticate(params[:session][:username],
                      params[:session][:password])
  end
  
  def session_controller?
    puts params[:controller]
    params[:controller] == "clearance/sessions"
  end
  
end
