class AddAttachmentAvatarToUsers < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :users, :avatar
  end
end
