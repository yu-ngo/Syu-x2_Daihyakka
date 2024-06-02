class Public::PostsController < ApplicationController
  def new
    @posts=Post.new
  end
  
  private
  def post_params
    params.require(:post).permit(:title, :read, :meaning, :image)
  end

end
