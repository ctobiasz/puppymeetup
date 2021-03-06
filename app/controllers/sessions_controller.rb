class SessionsController < ApplicationController
# layout false

def new
  if !logged_in?
    @user = User.new
  end
end

def create
  user = User.find_by(email: params[:session][:email].downcase)
  if user && user.authenticate(params[:session][:password])
    log_in user
    redirect_to user
   else
     flash[:danger] = 'Invalid email/password combination'
     render 'new'
  end
end

def destroy
  log_out
  redirect_to root_path
end

end
