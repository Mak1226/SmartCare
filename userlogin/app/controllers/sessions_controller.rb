class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
       session[:user_id] = user.id
       redirect_to root_url, notice: "Success 200 OK"
     else
       redirect_to login_path
       flash.now[:alert] = "Fail 200 OK"
     end
   end
   def destroy
     session[:user_id] = nil
     redirect_to root_url, notice: "Logged out!"
   end  
end
