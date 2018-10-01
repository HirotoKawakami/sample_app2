class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps null: false
    end
    add_index :relationships, :follower_id
    add_index :relationships, :followed_id
    # あるユーザーがあるユーザーを2回以上フォローするという事故を防ぐための複合インデックス
    add_index :relationships, [:follower_id, :followed_id], unique: true
  end
end