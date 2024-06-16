class Public::PostsController < ApplicationController
  def new
    @post_new=Post.new
  end

  #投稿データの保存
  def create
    @post_new=Post.new(post_new_params)#50行目のpost_paramsとリンク
    @post_new.user_id=current_public.id
    if @post_new.save
      flash[:notice]="更新が完了しました☆"
      redirect_to public_posts_path(@post_new.id)
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
    # @post=Post.find(params[:id])
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

  def post_new_params
   params.require(:post).permit(:title, :read, :meaning)
  # require:送られてきたデータの中からモデル名を指定し、データんを絞り込む。　permit:requireで絞り込んだデータの中から、保存を許可するカラムを指定します。
  end
end