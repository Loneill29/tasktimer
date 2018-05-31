class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @user = current_user
    @item = Item.new(item_params)
    @item.user = current_user

    if @item.save!
      flash[:notice] = "Item was saved."
      redirect_to root_path
    else
      flash[:error] = "There was an error creating the item. Please try again."
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :user)
  end
end
