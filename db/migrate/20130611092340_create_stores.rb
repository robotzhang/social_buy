class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.references :user
      t.string :name # 店铺名称

      t.timestamps
    end
  end
end
