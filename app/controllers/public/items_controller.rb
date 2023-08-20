class Public::ItemsController < ApplicationController

  def index
    @items = Item.all.page(params[:page]).per(9)
    @genres = Genre.all
  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @member = current_member
  end
end
