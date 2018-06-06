class RequestsController < ApplicationController
  def new
  end
  def create
    @collection = Collection.new(params[:request].permit(:title, :text))

    @collection.save
    redirect_to @collection
  end
end
