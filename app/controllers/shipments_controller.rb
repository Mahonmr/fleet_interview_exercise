class ShipmentsController < ApplicationController
  def index
    @shipments = Shipment.all
  end

  def import
    Shipment.import(params[:file])
    redirect_to root_url, notice: "Shipments imported."
  end
end
