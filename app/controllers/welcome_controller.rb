class WelcomeController < ApplicationController

	def index
    

    if user_signed_in?

	redirect_to items_home_path

  
    end 

	end

end
