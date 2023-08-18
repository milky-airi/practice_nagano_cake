class Admin::ItemsController < ApplicationController


  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item)
    else
      @item = Item.new(item_params)
      render :new
    end
  end

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path(@item.id)
    else
      @item = Item.find(params[:id])
      render :edit
    end
  end

  private

    def item_params
      params.require(:item).permit(:genre_id, :name, :detail, :price, :is_active, :image)
    end

end
