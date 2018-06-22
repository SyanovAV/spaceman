class ResponsesController < ApplicationController
  def index
    @collection = Item.find(params[:collection_id])
    @request = @collection.requests.all
  end

  def show
    @collection = Item.find(params[:collection_id])
    @request = @collection.find(params[:id])
  end

  def new
    @collection = Item.new
  end

  def edit
    @collection = Item.find(params[:id])
  end

  def update
    @collection = Item.find(params[:id])

    if @collection.update(item_params)
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
    @collection = Item.find(params[:collection_id])
    @request = @collection.request.create(request_params)
    #redirect_to request_path(@request)
  end

  private
  def request_params
    params.require(:request).permit(:name, :description, :raw_headers, :method, :url)
  end
end
