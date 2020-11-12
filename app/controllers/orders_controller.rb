class OrdersController < ApplicationController

  def index
    @orders_adresses = OrderAdress.all
  end

  def create
  end
end
