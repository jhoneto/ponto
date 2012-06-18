class ApplicationController < ActionController::Base
  include Clearance::Authentication
  protect_from_forgery
  before_filter :authorize

  def authenticate(params)
    User.authenticate(params[:session][:username],
                      params[:session][:password])
  end
  
end
