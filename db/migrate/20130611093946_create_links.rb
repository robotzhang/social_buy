class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.references :store
      t.string :name # 链接到站外店铺的名称
      t.string :url # 站外网店的url

      t.timestamps
    end
  end
end
