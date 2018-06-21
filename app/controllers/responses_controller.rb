class ResponsesController < ApplicationController
  def index
    @collection = Collection.find(params[:collection_id])
    @request = @collection.requests.all
  end

  def show
    @collection = Collection.find(params[:collection_id])
    @request = @collection.find(params[:id])
  end

  def new
    @collection = Collection.new
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

  def destroy
    @collection.find(params[:id])
    @collection.destroy

    redirect_to collection_path
  end


  def create
    @collection = Collection.find(params[:collection_id])
    @request = @collection.request.create(request_params)
    #redirect_to request_path(@request)
  end

  private
  def request_params
    params.require(:request).permit(:name, :description, :raw_headers, :method, :url)
  end
end
