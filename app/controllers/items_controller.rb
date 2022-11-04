class ItemsController < ApplicationController
  def index
    if params[:user_id]
      user = User.find(params[:user_id])
      items = user.items
    else 
    items = Item.all
    end
    render json: items, include: :user
  end

  def show
    if params[:user_id]
      user = User.find(params[:user_id])
      item = user.items.find(params[:id])
    else
      item = Item.find(params[:id])
    end
      
    render json: item
  end

  def create
    user = User.find(params[:user_id])
    item = user.items.create(params.permit(:name, :description, :price))
    render json: item, status: :created
  end

end
