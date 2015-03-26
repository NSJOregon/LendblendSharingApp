class NotborrowedController < ApplicationController
  def index
  
  @not_checked_out_items = current_user.not_borrowed_items

  end
end
