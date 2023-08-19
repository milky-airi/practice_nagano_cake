class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!, only: [:update]

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.making_status = params[:order_detail][:making_status]
    if @order_detail.update(order_detail_params)
      redirect_back(fallback_location: root_path)
    else
      @order = Order.find(params[:id])
      @order_details = OrderDetail.where(order_id: @order.id)
      render "order/show"
    end

  end

    private

      def order_detail_params
        params.require(:order_detail).permit(:making_status)
      end

end
