class MenusController < ApplicationController

  def create
    @menu = Menu.new(menu_params)
    respond_to do |format|
      if @menu.save
        format.html { redirect_to detail_path, notice: "Menu item was successfully added." }
      else 
        format.html { redirect_to detail_path, alert: @menu.errors.full_messages.join(', ') }
      end
    end
  end

  private

    def menu_params
      params.require(:menu).permit(:date, :product_id, :price)
    end
end
