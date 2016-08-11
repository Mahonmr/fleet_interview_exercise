class AddDateTimeToShipment < ActiveRecord::Migration
  def change
    add_column :shipments, :date_time, :timestamp
  end
end
