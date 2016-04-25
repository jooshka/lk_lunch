class MenusController < ApplicationController

  def create
    @menu = Menu.new(menu_params)
    respond_to do |format|
      if @menu.save
        flash[:notice] = "Menu item was successfully added."
      else 
        flash[:alert] = @menu.errors.full_messages.join(', ')
      end
      format.html { redirect_to detail_path }
    end
  end

  private

    def menu_params
      params.require(:menu).permit(:date, :product_id, :price)
    end
end
