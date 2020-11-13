class OrdersController < ApplicationController

  def index
    @order_adress = OrderAdress.new
    @item = Item.find(params[:item_id])
  end
  

  def create
    @order_adress = OrderAdress.new(order_params)
    if @order_adress.valid?
      @order_adress.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render action: :index
    end
  end

  private

  def order_params
    params.permit(:item_id, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id)
  end

end
