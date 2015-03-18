class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  
  def index
    @items = Item.all
  end


  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    #@item.lender.id = current_user.id

    if @item.save
      redirect_to items_path
    else
      @errors = @item.errors
      render :new
    end
  end

  def update
    @item = current_user.items.find(params[:id])

    if @item.update(item_params)

       redirect_to items_path
    else
       @errors = @item.errors
       render :edit
    end
  end


  def destroy
    @item = current_user.items.find(params[:id])
    @item.destroy
    
    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :borrow_period, :lender, :picture)
  end
end
