class PostsController < ApplicationController
  def new
  end

  def show
  end

  def edit
  end

  def index
  end

  private

  def post_params
  params.require(:posts).permit(:name, :description, :picture)
  end


end
