class Public::CustomersController < ApplicationController
  def index
    @posts_my=Post.all
  end

  def edit
    @customers=Customers.find(params[:id])
    if @customers.id !=current_user.id
      redirect_to user_posts_path(current_user.id)
    end
  end
end
