class CreateThemes < ActiveRecord::Migration
  def change
    create_table :themes do |t|
      t.references :store
      t.string :bg_image # 背景图片

      t.timestamps
    end
  end
end
