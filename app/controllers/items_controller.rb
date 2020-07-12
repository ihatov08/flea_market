class ItemsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  before_action :set_item, only: %i[show]

  def show
  end

  def new
    @item = current_user.items.build
  end

  def create
    @item = current_user.items.build(item_params)

    if @item.save
      redirect_to :root, notice: "商品の出品に成功しました"
    else
      flash.now[:alert] = "商品の出品に失敗しました"
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :name,
      :description,
      :category_id,
      :condition_id,
      :delivery_charge_id,
      :prefecture_id,
      :delivery_day_id,
      :delivery_way_id,
      :price,
      :images_cache,
      images: []
    )
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
