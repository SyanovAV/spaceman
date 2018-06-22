class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :jjj

  private

  def jjj
    @menu_items = Item.all
  end
end
