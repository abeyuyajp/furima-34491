class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]

  def index
    @purchase_delivery_address = PurchaseDeliveryAddress.new
  end
  
  def create
    @purchase_delivery_address = PurchaseDeliveryAddress.new(purchase_params)
    if @purchase_delivery_address.valid?
      @purchase_delivery_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def purchase_params
    params.require(:purchase_delivery_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
