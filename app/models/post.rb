class Post < ApplicationRecord
  belongs_to :public#migrate post fileのpublic_idカラムを呼び出す。

  validates :title, presence: true
  validates :read, presence: true
  validates :meaning, presence: true
  
end
