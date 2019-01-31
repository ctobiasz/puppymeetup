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
    if logged_in?
    @post =  Post.find_by(id: params[:id])
  else
    redirect_to root_path
  end
end

  def update
    @post = Post.find_by(id: params[:id])
      if @post.update(post_edit_params)
        flash[:notice] = "Sweet! Post is now looking better than ever!"
        redirect_to user_path
      else
        puts "#{@post.errors.messages}"
        render 'new'
      end
  end

  def index
    p ActiveStorage
    if current_user != nil
     # @post = Post.paginate(page: params[:page], per_page: 20)
     @posts  = Post.all
   else
     redirect_to root_path
   end
  end

  def destroy
  @post = Post.find(params[:id])
    respond_to do |format|
     format.html { redirect_to posts_url, notice: 'Post was successfully deleted' }
     format.js
   end
   @post.destroy
  end


  private

  def post_params
    params.require(:post).permit(:name, :description, :picture, :location_string)
  end

  def post_edit_params
    params.require(:post).permit(:name, :description, :purchased, :picture, :location_string)
  end


end
