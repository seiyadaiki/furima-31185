class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_item, only: [:index, :create]
  before_action :move_to_root_path, only: [:index, :create]
  before_action :move_to_index
  
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
    params.require(:order_adress).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.selling_price, # 商品の値段
      card: order_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def find_item
    @item = Item.find(params[:item_id])
  end

  def move_to_root_path
    redirect_to root_path if @item.user == current_user
  end

  def move_to_index
    redirect_to root_path if @item.user == current_user || @item.order != nil
  end
end
