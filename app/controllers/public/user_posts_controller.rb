class Public::UserPostsController < ApplicationController
  def index
    @user_posts=User_post.all
  end

  def show
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
