class RecipesController < ApplicationController
# Rails automaticaly loads the page name that matches with the function
 def index
     @recipes = Recipe.all
 end   

 def show #we can use "bindings.pry" to puth the server on hold, 
    @recipe = Recipe.find(params[:id])#view the parameters on the url, the use  "params[whatever: ,whtaever:]"    
 end
 #the "new" method willl be used to mass assighn , a new rercipe,, it will do this vua the recipe params method,,
#  the recipe params method on the other hand only allows :name :summary and :description yo pass through
 def new
    @recipe = Recipe.new #we do not pass anything to the init..
 end
 def create
    #  binding.pry #to chck the parameters bieng passed to the method usin it makes the server completley freeze
    @recipe = Recipe.new(recipe_params)#pass the variable from the "recipe_params" method 
    @recipe.user =User.find(1)
    if @recipe.save #if save was succesfull
        flash[:success]="Your recipe Creation was succesfull"
        redirect_to recipes_path
        #return home
    else
        render :new
    end
 end
 def edit
    @recipe = Recipe.find(params[:id])
 end
 def update
     @recipe = Recipe.find(params[:id])
     if @recipe.update(recipe_params)
        flash[:success]= "Your Recipe has been updated"
        redirect_to recipes_path(@recipe)
     else
        render :edit
     end
 end
 private #private method
    def recipe_params # :recipe is the top most object
        params.require(:recipe).permit(:name,:summary,:description, :picture) #its called frst to check/ filter the vars to be passed to create
    end
end