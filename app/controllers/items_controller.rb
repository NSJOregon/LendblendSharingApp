class ItemsController < ApplicationController

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

@item = Item.new(name: params[:item][:name], description: params[:item][:description], borrow_period: params[:item][:borrow_period], owner_id: params[:item][:owner_id], picture: params[:item][:picture])
@item.borrower_id=current_user.id
if @item.save
  redirect_to items_path
else
  @errors = @item.errors
  render :new
end


end

def update
@item = Item.find(params[:id])
if @item.update(name: params[:item][:name], description: params[:item][:description], borrow_period: params[:item][:borrow_period], owner_id: params[:item][:owner_id], picture: params[:item][:picture])

   redirect_to items_path
else
   @errors = @item.errors
   render :edit
end

end


def destroy

@item = Item.find(params[:id])
@item.destroy
redirect_to items_path

end



end
