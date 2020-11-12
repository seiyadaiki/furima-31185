class OrdersController < ApplicationController

  def index
    #@orders = Order.find(order.id)
    #@adresses = Adress.find(order.id)
    @order_adress = OrderAdress.new
    @item = Item.find(params[:item_id])
  end
  

  def create
  end
end
