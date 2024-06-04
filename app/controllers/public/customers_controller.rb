class Public::CustomersController < ApplicationController
  def index
    @posts_my=Post.all
  end

  def edit
  end
end
