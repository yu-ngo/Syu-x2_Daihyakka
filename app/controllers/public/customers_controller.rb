class Public::CustomersController < ApplicationController
  def index
   @posts_my=Post.all
  end

  def create
   profile_my=Public.new(user_params)
   if profile_my.save
    flash[:notice]="ようこそ！サインアップに成功しました!"
    redirect_to public_posts_path(profile_my.id)
   else
    render :index
   end
  end

  def edit
   @profile_my=Public.find(params[:id])
   if @profile_my.id != current_public.id
    redirect_to public_customers_path(current_public.id)
   end
  end

  def update
   profile_my=Public.find(params[:id])
   if profile_my.update(user_params)
    flash[:notice]="更新されました"
    redirect_to public_customers_path(profile_my.id)
   else
    render:edit
   end
  end

  private

  def post_params
   params.permit(:name, :introduction)#.require(:public)
  # require:送られてきたデータの中からモデル名を指定し、データんを絞り込む。　permit:requireで絞り込んだデータの中から、保存を許可するカラムを指定します。
  end

end