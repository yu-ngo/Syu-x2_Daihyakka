class Post < ApplicationRecord
  belongs_to :public

  validates :title, presence: true
  validates :read, presence: true
  validates :meaning, presence: true
  
end
