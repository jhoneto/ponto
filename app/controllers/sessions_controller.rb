class SessionsController < Clearance::SessionsController
  
  layout "login"
  
  def new
    # my special new action
    puts "************************"
  end
  

end