class UsersController < ApplicationController
  def new
    @user = User.new
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
    if current_user != nil
    @user = User.find_by(id: params[:id])
  else
      redirect_to root_path
    end
  end

  def index
    if current_user != nil
      @user = User.all
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
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :username, :password, :password_confirmation, :location_string, :purchased, :avatar)
  end

end
