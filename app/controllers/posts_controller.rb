class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @user = User.find(session[:user_id])
    @user.posts << @post
    if @post.valid?
      @post.save
      flash[:notice] = "Puppy Date Activated!"
      redirect_to @user
    else
      puts "#{@post.errors.messages}"
      flash[:notice] = "#{@post.errors.messages}"
      render 'new'
    end
  end

  def show
    if current_user != nil
     @post = Post.find_by(id: params[:id])
    else
     redirect_to root_path
   end
  end

  def edit
    @post =  Post.find_by(id: params[:id])
    if current_user.id != @user.id
      redirect_to root_path
    end
  end

  def update
    @post = Post.find_by(id: params[:id])
      if @post.update(post_edit_params)
        flash[:notice] = "Sweet! Post is now looking better than ever!"
        redirect_to @post
      else
        puts "#{@post.errors.messages}"
        render 'new'
      end
  end

  def index
    if current_user != nil
     @post = Post.paginate(page: params[:page], per_page: 20)
   else
     redirect_to root_path
   end
  end

  private

  def post_params
    params.require(:post).permit(:name, :description, :picture)
  end

  def post_edit_params
    params.require(:post).permit(:name, :description, :purchased, :picture)
  end


end
