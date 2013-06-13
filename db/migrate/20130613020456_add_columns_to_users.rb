class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :description, :string # 个人简介
    add_column :users, :email, :string
    add_column :users, :password_digest, :string
  end
end
