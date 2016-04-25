class HomeController < ApplicationController

  def index
    @start_date = valid_date(params[:date]).monday
  end

  def detail
    @menu_date = valid_date(params[:date])

    @menus = {}
    Category.all.each do |category|
      @menus[category] = Menu.by_date_category(@menu_date, category)
    end

  end

  private

    def valid_date(a_string)
      Date.parse(a_string)
    rescue
      Date.current
    end

end
