class Users::RegistrationsController < ApplicationController
  #以下はゲストログイン
  before_action :ensure_normal_user, only: :destroy
  
  def ensure_nomal_user
    if resource.email=='guest@example.com'
      redirect_to root_path, alert: 'ゲストユーザーは削除できません。'
    end
  end
end
