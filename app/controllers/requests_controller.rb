class RequestsController < ApplicationController
  def index
    @request = Request.where(item_id: params[:item_id]).all
  end

  def show
    @request = Request.find(params[:id])
  end

  def new
    @item = Item.find(params[:item_id])
    @request = @item.requests.build
  end

  def edit
    @request = Request.find(params[:id])
  end

  def update
    @request = Request.find(params[:id])

    if @request.update(request_params)
      redirect_to request_path(@request, item_id: params[:item_id])
    else
      render 'requests/edit'
    end
  end

  def destroy
    @request = Request.find(params[:id])
    @request.destroy

    redirect_to item_requests_path(item_id: params[:item_id])
  end


  def create
    @item = Item.find(request_params[:item_id])
    @request = @item.requests.build(request_params)
    if @request.save
      redirect_to item_requests_path(item_id: params[:item_id])
    else
      render 'requests/new'
    end
  end

  private

  def request_params
    params.require(:request).permit(:name, :description, :raw_headers, :url, :item_id)
  end
end
