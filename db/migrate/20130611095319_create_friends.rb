class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.references :user
      t.integer :friend_id # alias of user_id
      t.string :friend_type # flower or flowing

      t.timestamps
    end
  end
end
