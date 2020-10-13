class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  def index
  end


  def show
  end

  def new
    @item = Item.new
    @item.item_images.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      flash.now[:alert] = 'エラー : 必須項目を入力してください。'
      render :new
    end
  end
  
  def purchase
  end

  def edit
    @item = Item.find(params[:id])
  end

  private
  
  def item_params
    params.require(:item).permit(:name, :price, :explanation, :brand, :size_id, :state_id, :shipping_charge_id, :prefecture_id, :shipping_date_id, item_images_attributes: [:url]).merge(user_id: current_user.id, category_id: "1")
  end
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
