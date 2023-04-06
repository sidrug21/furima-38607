class PurchaseShippingAddressesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :prevent_url, only: [:index, :create]

  def index
    @purchase_shipping_address = PurchaseShippingAddress.new
  end

  def create
    @purchase_shipping_address = PurchaseShippingAddress.new(purchase_shipping_address_params)
    if @purchase_shipping_address.valid?
      pay_item
      @purchase_shipping_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  def show
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def purchase_shipping_address_params
    params.require(:purchase_shipping_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(
      token: params[:token], item_id: params[:item_id], user_id: current_user.id
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_shipping_address_params[:token],
      currency: 'jpy'
    )
  end

  def prevent_url
    return unless @item.user_id == current_user.id || !@item.purchase.nil?

    redirect_to root_path
  end
end
