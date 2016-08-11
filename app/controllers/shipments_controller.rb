class ShipmentsController < ApplicationController
  before_filter :load_shipment, only: [:activate]


  def index
    @shipments = Shipment.all
    @origin_shipments = Shipment.origin.sort_by {|k,v| v}.reverse
    @distination_shipments = Shipment.destination.sort_by {|k,v| v}.reverse
  end

  def activate
    if @shipment.update_attribute(:active, 1)
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
    flash[:success] = "Shipments imported."
    redirect_to root_url
  end

  private

  def load_shipment
    @shipment = Shipment.find(params[:id])
  end
end
