class Public::CartItemsController < ApplicationController
  before_action :authenticate_member!, only: [:create, :index, :update, :destroy, :destroy_all]

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.item_id = params[:cart_item][:item_id]
    @cart_item.member_id = params[:cart_item][:member_id]
    if @cart_item.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def index
    @cart_items = CartItem.where(member_id: current_member.id)
  end

  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      redirect_to cart_items_path
    else
      @cart_items = CartItem.where(member_id: current_member.id)
      render :index
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_back(fallback_location: root_path)
  end

  def destroy_all
    @cart_items = CartItem.where(member_id: current_member.id)
    @cart_items.each do |cart_item|
      cart_item.destroy
    end
    redirect_to items_path
  end

  private

    def cart_item_params
      params.require(:cart_item).permit(:quantity, :member_id, :item_id)
    end

end
