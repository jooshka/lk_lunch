class HomeController < ApplicationController

  def index
    @start_date = valid_date(params[:date]).monday
  end

  private

    def valid_date(a_string)
      Date.parse(a_string)
    rescue
      Date.current
    end

end
