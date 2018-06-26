class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @resource = Item.find_or_initialize_by(id: params[:item_id])
    @item = @resource.childrens.build
  end

  def create
    @item_parent = Item.find_or_initialize_by(id: item_params[:item_id])
    @item = @item_parent.childrens.build(item_params)

    if @item.save
      redirect_to @item
    else
      render 'new'
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])

    if @item.update(item_params)
      redirect_to @item
    else
      render 'edit'
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    redirect_to items_path
  end

  private
  def item_params
    params.require(:item).permit(:name, :description)
  end


end
