class ItemsController < ApplicationController
  
  require "date"
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  

  def index
    @items = current_user.items.all
  end

  def home
    @owned_items = current_user.items.all
    @already_borrowed_items = current_user.borrowed_items
    @all_borrowable_items = current_user.borrowable_items
  end


  def borrowable
    @all_borrowable_items = current_user.borrowable_items
    
    @item2 = session[:name]
    session[:name]=""
    
  end

  def borrow_borrowable
    @item = Item.find(params[:id])
    @item.borrowed_period=DateTime.now
    session[:name] = "You borrowed " + @item.name + "!"
   
    current_user.borrow(@item)  
    redirect_to items_borrowable_path
  end

  def borrowed
    @already_borrowed_items = current_user.borrowed_items
  end

  def returned
    @item = Item.find(params[:id])
    current_user.unborrow(@item)
    redirect_to items_path
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
    @item = current_user.items.new(item_params)
    @item.borrowed_period=DateTime.now
    if @item.save
      redirect_to items_path
    else
      @errors = @item.errors
      render :new
    end
  end

  def update
    @item = current_user.items.find(params[:id])
    @item.borrowed_period=DateTime.now
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
    params.require(:item).permit(:id, :name, :description, :borrow_period, :borrower_id,:lender, :picture)
  end
end
