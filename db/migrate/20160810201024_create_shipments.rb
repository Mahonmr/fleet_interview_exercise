class CreateShipments < ActiveRecord::Migration
  def change
    create_table :shipments do |t|
      t.string :orgin
      t.string :destination
      t.decimal :shipment_value, precision: 10, scale: 2

      t.timestamps null: false
    end
  end
end
