class HomeController < ApplicationController

  def index
    @start_date = valid_date(params[:date]).monday
  end

  def detail
    @menu_date = valid_date(params[:date])
    @menu = Menu.where(:date => @menu_date)
  end

  private

    def valid_date(a_string)
      Date.parse(a_string)
    rescue
      Date.current
    end

end
