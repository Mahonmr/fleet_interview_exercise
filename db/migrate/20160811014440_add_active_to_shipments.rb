class AddActiveToShipments < ActiveRecord::Migration
  def change
    add_column :shipments, :active, :boolean
  end
end
