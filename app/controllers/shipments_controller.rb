class ShipmentsController < ApplicationController
  before_filter :load_shipment, only: [:activate]


  def index
    @shipments = Shipment.all
  end

  def activate
    if @shipment.update_attribute(:active, 1)
      @notice = "Shipment activated"
    else
      flash[:alert] = "Shipment was not activated"
      redirect_to shipments_path
    end
    respond_to do |format|
      format.html { redirect_to shipments_path }
      format.js
    end
  end

  def import
    Shipment.import(params[:file])
    redirect_to root_url, notice: "Shipments imported."
  end

  private

  def load_shipment
    @shipment = Shipment.find(params[:id])
  end
end
