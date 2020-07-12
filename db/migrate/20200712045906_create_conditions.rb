class CreateConditions < ActiveRecord::Migration[6.0]
  def change
    create_table :conditions do |t|
      t.string :value, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
