class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t| # 主营业务表
      t.references :store
      t.string :name

      t.timestamps
    end
  end
end
