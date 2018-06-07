class CollectionsController < ApplicationController
  def index
    @collection = Collection.all
  end

  def show
    @collection = Collection.find(params[:id])
  end

  def new
    @collection = Collection.new
  end

  def edit
    @collection = Collection.find(params[:id])
  end

  def create
    @collection = Collection.new(collection_params)

    if @collection.save
      redirect_to @collection
    else
      render 'new'
    end
  end

  def update
    @collection = Collection.find(params[:id])

    if @collection.update(collection_params)
      redirect_to @collection
    else
      render 'edit'
    end
  end

  def destroy
    @collection = Collection.find(params[:id])
    @collection.destroy

    redirect_to collections_path
  end

  private

  def collection_params
    params.require(:collection).permit(:name, :description)
  end
end
