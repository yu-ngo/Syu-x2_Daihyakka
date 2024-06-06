class Public::CustomersController < ApplicationController
  def index
    @name_my=Name_my.find(params[:id])
    @posts_my=Post.all
  end

  def edit
    @name_my=Name_my.find(params[:id])
    if @name_my.id !=current_user.id
      redirect_to user_posts_path(current_user.id)
    end
  end
  
  def update
    @name_my=Name_my.find(params[:id])
    if @name_my(user_params)
     flash[:notice]="更新されました"
     redirect_to user_posts_path(@name_my.id)
    else
      render:edit
    end
  end
end
