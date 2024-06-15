class Public < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         #database_authenticatableはパスワードの正確性を検証
         #registerableはユーザ登録や編集、削除
         #recoverableはパスワードをリセット
         #rememberableはログイン情報を保存
         #validatableはemailのフォーマットなどのバリデーション
  has_many :post, dependent: :destroy
  has_one_attached :image
  #画像を使えるようにする記述(このモデルに使用宣言する)

  validates :name, presence: true, length: { in: 1..20 }, uniqueness: true
  validates :introduction, length: { maximum: 100 }

end
