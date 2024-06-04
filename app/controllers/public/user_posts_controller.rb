class Public::UserPostsController < ApplicationController
  def index
    #自分の投稿一覧及びマイ情報
    @posts=Post.all
  end

  def show
  end
  
  def edit
    @user=User.find(params[:id])
    if @user.id !=current_user.id
      redirect_to user_posts_path(current_user.id)
    end
  end
  
  def update
    @user=User.find(params[:id])
   if @user.update(user_params)
    flash[:notice]="更新しました."
    redirect_to user_path(@user.id)
   else
    render :edit
   end
  end
  
    def user_params
    params.require(:user).permit(:name, :introduction)
  end
end
