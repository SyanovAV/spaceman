class FoldersController < ApplicationController
  def index
    @folder = Folder.where(collection_id: params[:collection_id]).all
    #@collection = Collection.find(params[:collection_id])
    # @request = @collection.requests.all
  end

  def show
    @folder = Folder.where(collection_id: params[:collection_id]).find(params[:id])
  end

  def new
    # @collection = Collection.find(params[:collection_id]).requests.new
    @folder = Folder.new(collection_id: params[:collection_id])
  end

  def edit
    @folder = Folder.find(params[:id])
    # @request = @request.find(id: params[:id])
    # @collection = Collection.find(params[:id])
  end

  def update
    @folder = Folder.find(params[:id])

    if @folder.update(folder_params)
      redirect_to collection_folder_path(@folder, collection_id: params[:collection_id])
    else
      render 'edit'
    end
  end

  def destroy
    @folder = Folder.where(collection_id: params[:collection_id]).find(params[:id])
    @folder.destroy

    redirect_to collection_folders_path(collection_id: params[:collection_id])
  end

  def create
    @folder = Folder.new(folder_params)
    if @folder.save
      redirect_to collection_folders_path(collection_id: params[:collection_id])
    else
      render 'new'
    end
  end

  private

  def folder_params
    params.require(:request).permit(:name, :description,:collection_id)
  end
end
