class Shipment < ActiveRecord::Base
  require 'csv'

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|

      shipment_hash = row.to_hash # exclude the price field
      shipment = Shipment.where(id: shipment_hash["id"])

      if shipment.count == 1
        shipment.first.update_attributes(shipment_hash)
      else
        Shipment.create!(shipment_hash)
      end # end if !product.nil?
    end # end CSV.foreach
  end # end self.import(file)
end
