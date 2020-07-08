class PagesController < ApplicationController
  def home    
    if !user_signed_in?
      
    else 
      redirect_to  recipes_path
    end
  end
end
