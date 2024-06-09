class Public::PostsController < ApplicationController
  def new
    @post=Post.new
  end

  #投稿データの保存
  def create
    post=Post.new(post_params)
    post.save
    redirect_to public_posts_path
  end

  def show
    @post=Post.find(params[:id])
  end

  def index
    @user_posts=User.all
  end

  def edit
    @post=Post.find(params[:id])
    if @post.user.id !=current_user.id
      redirect_to public_customers_path
    end
  end

  def update
    post=Post.find(params[:id])
    post.update(post_params)
    redirect_to public_post_path(post.id)
  end

  def destroy
    post=Post.find(params[:id])
    post.delete
    redirect_to public_customers_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :read, :meaning, :image)
  end
end