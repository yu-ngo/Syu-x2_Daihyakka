class Public::PostsController < ApplicationController
  def new
    @post=Post.new
  end

  def show
    @post=Post.find(params[:id])
  end

  def destroy
    post=Post.find(params[:id])
    post.delete
    redirect_to customers_path
  end

  def index
    @user_posts=User_post.all
  end

  def edit
    @post=Post.find(params[:id])
    if @post.user.id !=current_user.id
      redirect_to customers_path
    end
  end

　#投稿データの保存
　def create
　  @post=Post.new(post_params)
　  @post.user_id=current_user.id
　  @post.save
　  redirect_to post_path
　end

  private
  def post_params
    params.require(:post).permit(:title, :read, :meaning, :image)
  end

end
