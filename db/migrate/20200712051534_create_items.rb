class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false
      t.string :description, null: false
      t.references :category, null: false, foreign_key: true
      t.string :brand_name
      t.references :condition, null: false, foreign_key: true
      t.references :delivery_charge, null: false, foreign_key: true
      t.references :prefecture, null: false, foreign_key: true
      t.references :delivery_way, null: false, foreign_key: true
      t.references :delivery_day, null: false, foreign_key: true
      t.string :price, null: false

      t.timestamps
    end
  end
end
