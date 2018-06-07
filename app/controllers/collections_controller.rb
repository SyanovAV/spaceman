class CollectionsController < ApplicationController
  def new
  end


  def index
    @collection = Collection.all
  end

  def show
    @collection = Collection.find(params[:id])
  end

  def create
    @collection = Collection.new(collection_params)
  #  @requests = Request.new(params[:collection].permit(:raw_headers, :url, :method))
    @collection.save
  #  @requests.save
    redirect_to @collection
  end

  def edit
    @collection = Collection.find(params[:id])
  end

  def update
    @collection = Collection.find(params[:id])

    if @collection.update(collection_params)
      redirect_to @collection
    else
      render 'edit'
    end
  end

  private
  def collection_params
    params.require(:collection).permit(:name, :description)
  end
end
