class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true
      t.boolean :status

      t.timestamps
    end
    # add_index :liked, :user_id
    # add_index :liked, :post_id
    # add_index :liked, [:user_id, :post_id], unique: true
  end
end
