class Api::MenuItemsController < ApplicationController
  before_action :set_menuitem, only: [:show, :update, :destroy]
  
  def index
    render json: MenuItem.all
  end

  def show
    render json: @menuitem
  end

  def create
    menuitem = MenuItem.new(menuitem_params)

    if menuitem.save
      render json: menuitem
    else
      render json: menuitem.errors, status: 422
    end
  end

  def update
    if @menuitem.update(menuitem_params)
      render json: @menuitem
    else
      render json: @menuitem.errors, status: 422
    end
  end

  def destroy
    @menuitem.destroy
  end

  private
  def set_menuitem
    @menuitem = MenuItem.find(param[:id])
  end

  def menuitem_params
    params.require(:menuitem).permit(:name)
  end
end
