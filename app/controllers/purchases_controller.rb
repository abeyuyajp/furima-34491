class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_purchase, only: [:index, :create]
  before_action :not_purchase, only: [:index]

  def index
    @purchase_delivery_address = PurchaseDeliveryAddress.new
  end
  
  def create
    @purchase_delivery_address = PurchaseDeliveryAddress.new(purchase_params)
    if @purchase_delivery_address.valid?
      pay_item
      @purchase_delivery_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def purchase_params
    params.require(:purchase_delivery_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token] )
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: Item.find(params[:item_id]).price,
        card: purchase_params[:token],
        currency: 'jpy'
      )
  end

  def set_purchase
    @purchase = Item.find(params[:item_id])
  end

  def not_purchase
    purchase = Item.find(params[:item_id])
    if user_signed_in? && current_user.id == purchase.user_id
      redirect_to root_path
    end
  end
end
