class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :menu_render

  private

  def menu_render
    @menu_items = Item.all
    @collection = @menu_items.where(collection_id: nil).includes(:folders)
  end
end
