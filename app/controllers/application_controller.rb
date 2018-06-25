class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :menu_render

  private

  def menu_render
    @menu_items = Item.all
    @resource = @menu_items.where(parent_id: nil).includes(:childrens)
  end
end
