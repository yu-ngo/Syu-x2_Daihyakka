class Public::PostsController < ApplicationController
  def new
    @post=Post.new
  end

  #投稿データの保存
  def create
    @post=Post.new(post_params)
    @post.user_id=current_user.id
    if @post.save
      flash[:notice]="更新が完了しました☆"
      redirect_to public_posts_path(@post)
    else
      @user_posts=User.all
      render :index
    end
  end

  def show
    @post=Post.find(params[:id])
  end

  def index
    @user_posts=User.all
    @post=Post.find(paramas[:id])
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
  def public_params
   params.require(:public).permit(:name, :introduction)
  end
end