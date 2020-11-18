class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :edit]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :move_to_index, only: [:edit, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path if @item.destroy
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :explanation, :category_id, :status_id, :shipping_fee_id, :location_id, :delivery_time_id, :selling_price).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless @item.user == current_user
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
