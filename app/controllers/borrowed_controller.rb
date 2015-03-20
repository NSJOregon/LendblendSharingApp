class BorrowedController < ApplicationController
  def index
  
  @checked_out_items = current_user.borrowed_items

  end
end
