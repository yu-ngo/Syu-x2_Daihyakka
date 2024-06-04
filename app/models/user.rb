class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #以下はゲストログイン
  GUEST_USER_EMAIL="guest@example.com"

  def self.guest
    find_or_create_by!(email: GUEST_USER_EMAIL) do |user|
    #find_or_create_byは、データの検索と作成を自動的に判断して処理を行う、Railsのメソッド
      user.password=SecureRandom.urlsafe_base64
      #SecureRandom.urlsafe_base64は、ランダムな文字列を生成するRubyのメソッドの一種
      user.name="guestuser"
    end
  end
end
