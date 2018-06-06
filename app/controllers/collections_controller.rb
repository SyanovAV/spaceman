class CollectionsController < ApplicationController
  def new
  end
  def create
    @collection = Collection.new(params.require(:collection).permit(:name, :description))
  #  @requests = Request.new(params[:collection].permit(:raw_headers, :url, :method))
    @collection.save
  #  @requests.save
    redirect_to @collection
  end
  def show
    @collection = Collection.find(params[:id])
  end
  def index
    @collection = Collection.all
  end
end
