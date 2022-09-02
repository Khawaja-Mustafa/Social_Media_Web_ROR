class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :description
      # Boolean value for determining the status of the post
      t.boolean :active
      # The post owners account reference
      t.references :account
      t.timestamps
    end
  end
end
