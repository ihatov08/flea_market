class CreateSizes < ActiveRecord::Migration[6.0]
  def change
    create_table :sizes do |t|
      t.references :category, null: false, foreign_key: true
      t.string :value, null: false

      t.timestamps
      t.index %i[category_id value], unique: true
    end
  end
end
