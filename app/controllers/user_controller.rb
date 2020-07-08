class UserController < ApplicationController
    def show
        @user = User.find(params[:id])
        @recipes= @user.recipes.paginate(page: params[:page], per_page: 3) 
    end
    def index
        @users = User.paginate(page: params[:page], per_page: 3)
    end     
end
   