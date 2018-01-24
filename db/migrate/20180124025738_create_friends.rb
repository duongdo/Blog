class CreateFriends < ActiveRecord::Migration[5.1]
  def change
    create_table :friends do |t|
      t.references :user, foreign_key: true
      t.integer :friend_id
      t.boolean :status

      t.timestamps
    end
    # add_index :relationships, :user_id
    # add_index :relationships, :friend_id
    # add_index :relationships, [:user_id, :friend_id], unique: true
  end
end
