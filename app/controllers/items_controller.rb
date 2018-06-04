class ItemsController < ApplicationController
  respond_to :html, :js

  def index
    @items = Item.all
  end

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

  def destroy
    @user = User.find(params[:user_id])
    @item = @user.items.find(params[:id])

    if @item.destroy
      flash[:notice] = "Item completed!"
    else
      flash[:error] = "There was an error removing the item. Please try again."
    end
    respond_to do |format|
        format.html
        format.js
      end
    end

  private

  def item_params
    params.require(:item).permit(:name, :user)
  end
end
