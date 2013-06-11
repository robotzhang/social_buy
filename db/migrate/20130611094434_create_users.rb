class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name # sina微博的用户名
      t.string :uid # sina微博的uid
      t.string :image # 头像地址
      t.string :role, :default => "member" # 权限

      t.timestamps
    end
  end
end
