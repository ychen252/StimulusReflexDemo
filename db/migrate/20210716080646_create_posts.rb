class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :username
      t.string :body
      t.integer :like_count
      t.integer :reposts_count

      t.timestamps
    end
  end
end
