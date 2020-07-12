class CreateDeliveryWays < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_ways do |t|
      t.references :delivery_charge, null: false, foreign_key: true
      t.string :value, null: false

      t.timestamps
      t.index %i[delivery_charge_id value], unique: true
    end
  end
end
