class Public::CustomersController < ApplicationController
  def index
   @profile_my=Profile.find(params[:id])
   @posts_my=Post.all
  end
  
  def create
   @profile_my=Profile.new(user_params)
   if @profile_my.save
    flash[:notice]="ようこそ！サインアップに成功しました!"
    redirect_to public_posts_path(@profile_my.id)
   else
    render :index
   end
  end
  
  def edit
   @profile_my=Profile.find(params[:id])
   if @profile_my.id !=current_user.id
    redirect_to user_posts_path(current_user.id)
   end
  end
  
  def update
   @profile_my=Profile.find(params[:id])
   if @profile_my.update(user_params)
    flash[:notice]="更新されました"
    redirect_to user_posts_path(@profile_my.id)
   else
    render:edit
   end
  end
  
end