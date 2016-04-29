class HomeController < ApplicationController

  include ApplicationHelper

  def index
    @start_date = valid_date(params[:date]).monday

    add_breadcrumb 'Week days', root_path(:date => @start_date)
  end

  def detail
    @date = valid_date(params[:date])
    @orders = current_user.orders.day(@date)
    @total_order = OrderItem.day_total(@date)

    add_breadcrumb 'Week days', root_path(:date => @date.monday)
    add_breadcrumb "Day", detail_path(:date => @date)
  end

end
