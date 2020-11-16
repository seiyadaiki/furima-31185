class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @order_adress = OrderAdress.new
  end
  

  def create
    @order_adress = OrderAdress.new(order_params)
    if @order_adress.valid?
      pay_item
      @order_adress.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.require(:order_adress).permit(:item_id, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id).merge(token: params[:token])
  end

  def pay_item
    Payjp.api_key =  ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
      amount: @item.selling_price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
