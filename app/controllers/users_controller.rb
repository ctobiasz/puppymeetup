class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token  

  def new
    @user = User.new
    render :layout => false
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      flash[:notice] = "User created!"
      log_in @user
      flash[:success] = "Welcome"
      redirect_to @user
    else
      flash[:notice] = "#{@user.errors.messages}"
      render 'new'
    end
  end


  def show
    @user = User.find_by(id: params[:id])
    if session[:user_id] == @user.id
  else
    redirect_to current_user
    end
  end

  def index
      @user = User.all
      if current_user == nil
    else
      redirect_to root_path
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
    if current_user.id != @user.id
      redirect_to root_path
    end
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update(user_params)
      flash[:notice] = "User updated"
       redirect_to @user
    else
      puts "#{@user.errors.messages}"
      render 'new'
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    session[:user_id] = nil
    redirect_to login_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :username, :password, :password_confirmation, :location_string, :purchased, :avatar)
  end

end
