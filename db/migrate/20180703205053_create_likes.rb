class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :user_id, null: false
      t.integer :micropost_id, null: false

      t.timestamps null: false
    end
    add_index :likes, :user_id
    add_index :likes, :micropost_id
    add_index :likes, [:user_id, :micropost_id], unique: true
  end
end
