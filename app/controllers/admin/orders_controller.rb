class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!, only: [:show, :index, :update]


  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order.id)
  end

  def index
    @orders = Order.all
  end

  def update
    @order = Order.find(params[:id])
    @order.status = params[:order][:status]
    if @order.update(order_params)
      redirect_back(fallback_location: root_path)
    else
      @order = Order.find(params[:id])
      @order_details = OrderDetail.where(order_id: @order.id)
      render :show
    end
  end

  private

    def order_params
      params.require(:order).permit(:status)
    end

end
