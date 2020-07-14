class RecipesController < ApplicationController
   before_action :set_recipe, only:[:update,:edit,:show,:like] #to eliminate @recipe= Recipe.find(id)
   before_action :require_login, except:[:show,:index]
   before_action :require_same_user , only:[:edit,:update] #specify the actrion
   before_action :admin_user, only: :destroy
   # protect_from_forgery

# Rails automaticaly loads the page name that matches with the function
 def index
    # @recipes = Recipe.all.sort_by{|likes| likes.thumbs_up_counter}.reverse #would sort the recipes in descending order of number of likes
    #to impelement the pagination Gem
    @recipes = Recipe.paginate(page: params[:page],per_page: 4) #will impelemn will paginate-> the last part ie the per page is optional
 end   

 def show #we can use "bindings.pry" to puth the server on hold, 
     #view the parameters on the url, the use  "params[whatever: ,whtaever:]"    
 end
 #the "new" method willl be used to mass assighn , a new rercipe,, it will do this vua the recipe params method,,
#  the recipe params method on the other hand only allows :name :summary and :description yo pass through
 def new
    @recipe = Recipe.new #we do not pass anything to the init..
 end
 def create
    #  binding.pry #to chck the parameters bieng passed to the method usin it makes the server completley freeze
    @recipe = Recipe.new(recipe_params)#pass the variable from the "recipe_params" method 
    @recipe.user = current_user
    if @recipe.save #if save was succesfull
        flash[:success]="Your recipe Creation was succesfull"
        redirect_to recipes_path
        #return home
    else
        render :new
    end
 end
 def edit
    
 end
 def update 
     
     if @recipe.update(recipe_params)
        flash[:success]= "Your Recipe has been updated"
        redirect_to recipes_path(@recipe)
     else
        render :edit
     end
 end
 def like  
    @like=Like.create(like: params[:like], user: User.first, recipe: @recipe ) #use the relationships GODDAMNIT
    if @like.save #if save was succesfull
      flash[:info]="Your like was recorded"
      redirect_back fallback_location: root_path
      #return home
  else
   flash[:danger]="Youve already Voted For this Recipe"
   redirect_back fallback_location: root_path
  end
end
def destroy
   Recipe.find(params[:id]).destroy
   flash[:success] = "Deleted succesfully"
   redirect_to recipes_path
end
 private #private methods
    def recipe_params # :recipe is the top most object
        params.require(:recipe).permit(:name,:summary,:description, :picture ,style_ids:[],ingredient_ids: []) #its called frst to check/ filter the vars to be passed to create
    end
    
    def set_recipe
      @recipe = Recipe.find(params[:id])    
    end
    def require_same_user
      if current_user != @recipe.user && !current_user.admin
         flash[:danger]='You can only edit your own recipes'
         redirect_back fallback_location: root_path
      else
      end
      
    end
    def admin_user
      redirect_to recipes_path unless current_user.admin?
   end
end