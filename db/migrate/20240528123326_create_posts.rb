class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :read
      t.string :meaning
      t.integer :number_likes
      t.integer :comment_likes
      t.integer :user_id
      t.timestamps
    end
  end
end
