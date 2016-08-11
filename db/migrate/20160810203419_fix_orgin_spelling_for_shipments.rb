class FixOrginSpellingForShipments < ActiveRecord::Migration
  def change
    rename_column :shipments, :orgin, :origin
  end
end
