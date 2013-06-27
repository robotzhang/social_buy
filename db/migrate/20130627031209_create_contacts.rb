class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.references :user
      t.string :provider # 类型
      t.string :way # 具体方式

      t.timestamps
    end
  end
end
