class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def quick_show
    @item = Item.find(params[:id])
  end

  def new; end

  def create
    @item_parent = Item.find_or_initialize_by(id: item_params[:parent_id])
    @item = @item_parent.childrens.build(item_params)

    if @item.save
      if @item.parent_id == nil
        redirect_to @item
      else
        redirect_to @item_parent
      end
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])

    if @item.update(item_params)
      if @item.parent_id == nil
        redirect_to @item
      else
        redirect_to item_path(id: @item.parent_id)
      end
    else
      render 'items/edit', :remote => true
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    if @item.parent_id == nil
      redirect_to :root
    else redirect_to item_path(id: @item.parent_id)
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :parent_id)
  end
end
