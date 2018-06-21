class RequestsController < ApplicationController
  def index
    @request = Request.where(collection_id: params[:collection_id]).all
    #@collection = Collection.find(params[:collection_id])
   # @request = @collection.requests.all
  end

  def show
    @request = Request.find(params[:id])
  end

  def new
    # @collection = Collection.find(params[:collection_id]).requests.new
    @request = Request.new(collection_id: params[:collection_id], folder_id: params[:folder_id])
  end

  def edit
    @request = Request.where(collection_id: params[:collection_id], folder_id: params[:folder_id]).find(params[:id])
   # @request = @request.find(id: params[:id])
   # @collection = Collection.find(params[:id])
  end

  def update
    @request = Request.find(params[:id])

    if @request.update(request_params)
      redirect_to collection_requests_path(@request, collection_id: params[:collection_id])
    else
      render 'edit'
    end
  end

  def destroy
    @request = Request.where(collection_id: params[:collection_id], folder_id: params[:folder_id]).find(params[:id])
    @request.destroy

    redirect_to collection_requests_path(collection_id: params[:collection_id], folder_id: params[:folder_id])
  end


  def create
    @request = Request.new(request_params)
    if @request.save
      redirect_to collection_requests_path(collection_id: params[:collection_id], folder_id: params[:folder_id])
    else
      render 'requests/new'
    end
  end

  private

  def request_params
    params.require(:request).permit(:name, :description, :raw_headers, :method, :url, :collection_id, :folder_id)
  end
end
