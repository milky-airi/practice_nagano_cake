class Public::ItemsController < ApplicationController
  before_action :authenticate_member!, only: [:show]

  def index
    @items = Item.where(is_active: true)
    @genres = Genre.all
  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @member = current_member
  end
end
