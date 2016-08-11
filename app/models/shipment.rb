class Shipment < ActiveRecord::Base
  require 'csv'

  scope :active_shipments, -> { Shipment.where('active = ?', true) }

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|

      shipment_hash = row.to_hash
      shipment = Shipment.where(id: shipment_hash["id"])

      if shipment.count == 1
        shipment.first.update_attributes(shipment_hash)
      else
        Shipment.create!(shipment_hash)
      end
    end
  end

  def self.shipment_cost
    total = 0
    active_shipments.each do |shipment|
      total += shipment.shipment_value
    end
    total
  end

  def add_yellow
    return 'yellow' if self.active
  end
end
