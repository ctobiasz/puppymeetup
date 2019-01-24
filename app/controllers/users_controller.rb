class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      flash[:notice] = "User created!"
    else
      flash[:notice] = "#{@user.errors.messages}"
      render 'new'
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def index
    @user = User.all
  end

  def edit
    @user = User.find_by(id: params[:id])
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
    params.require(:user).permit(:first_name, :last_name, :email, :username, :password, :password_confirmation, :purchased)
  end

end
