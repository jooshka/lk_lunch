class OrdersController < ApplicationController

  include ApplicationHelper

  def new
    @date = valid_date(params[:date])
    @order = Order.new
    @order.order_items.build

    add_breadcrumb 'Week days', root_path(:date => @date.monday)
    add_breadcrumb "Day", detail_path(:date => @date)
    add_breadcrumb "New order", new_order_path(:date => @date)
  end

  def create
    @order = current_user.orders.build(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to detail_path(:date => @order.date) }
      else 
        format.html { redirect_to :back, alert: @order.errors.full_messages.join(', ') }
      end
    end
  end

  private

    def order_params
      params.require(:order).permit(:date, order_items_attributes: :menu_id )
    end

end
