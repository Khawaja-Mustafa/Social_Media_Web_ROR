class CreateFriendships < ActiveRecord::Migration[6.0]
  def change
    create_table :friendships do |t|
      t.integer :account_id
      t.integer :friend_id
      t.string :create
      t.string :destroy

      t.timestamps
    end
  end
end
