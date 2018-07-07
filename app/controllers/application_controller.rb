class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :item_build
  before_action :item_show
  before_action :menu_render

  private

  def menu_render
    @menu_items = Item.all
    @collection = @menu_items.where(parent_id: nil).includes(:requests, childrens: :requests)
  end

  def item_build
    @resource = Item.find_or_initialize_by(id: params[:parent_id])
    @item = @resource.childrens.build
  end

  def item_show
    @view_item = Item.find_or_initialize_by(id: params[:id])
  end
end
