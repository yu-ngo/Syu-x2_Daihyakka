class Public::PostsController < ApplicationController
  def new
    @post_new=Post.new
  end

  #投稿データの保存
  def create
    @post_new=Post.new(post_params)#50行目のpost_paramsとリンク
    @post_new.public_id=current_public.id
    if @post_new.save
      flash[:notice]="投稿に成功しました"
      redirect_to public_posts_path(@post_new.id)
    else
      @posts_my=Post.all
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
    if @post.public.id !=current_public.id
      redirect_to public_customers_path
    end
  end

  def update
    post=Post.find(params[:id])
    if post.update(post_params)
      flash[:notice]="更新が完了しました。"
      redirect_to public_post_path(post.id)
    else
      render :edit
    end
  end

  def destroy
    post=Post.find(params[:id])#データ（レコード）を1件取得
    post.destroy#データ（レコード）を削除
    redirect_to public_customers_path#投稿一覧画面へリダイレクト
  end


  private

  def post_params
   params.require(:post).permit(:title, :read, :meaning)
  # require:送られてきたデータの中からモデル名を指定し、データんを絞り込む。　permit:requireで絞り込んだデータの中から、保存を許可するカラムを指定します。
  end

end