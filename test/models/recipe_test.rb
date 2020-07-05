require 'test_helper'
class RecipeTest < ActiveSupport::TestCase
    #  this is the class that will be used to test the Recipe class validations
    def setup 
        # when useing creaate method .. an  error is thrown;
        @user = User.new( id:4, name:"Johnny",email:"johmny@gmail.com" ,password:"johnyrulles")
        @recipe = @user.recipes.build(name: "chipusi",summary: "chips ni viazi vilivyo katwa na kuokwa motoni",
            description:"viazi vilivyo pikwa it was first introduced to kenya from portogoal")
    end
    
    # a recipe should belong to a specific user 
    test "user_id should be present" do
        @recipe.user_id= nil
        assert_not @recipe.valid?
    end
    # should assert only ehen the recipe is valid according to the rules ir validations on Recipe
    test "recipe should be valid" do
        assert @recipe.valid?, "#{@recipe.inspect} and #{@user.inspect}"
    end
    # should not assert if the name dield of object is blank
    test "name should be present" do
        @recipe.name=" "
        assert_not @recipe.valid?
    end
    # should not aaser if the ccobjec if thre length supases 100
    test "name length should'nt be long " do
      @recipe.name="a"*101
      assert_not @recipe.valid?  
    end 
    # name !>4
    test "name lenth shouldnt be too short" do
        @recipe.name="aaaa"
        assert_not @recipe.valid?
    end
    # summary !=null
    test "summary should be present" do
        @recipe.summary=" "
        assert_not @recipe.valid?
    end
    # summary !>150
    test "sumarry length shouldnt be too long" do
        @recipe.summary="a"*151
        assert_not @recipe.valid?
    end
    # summary !<10
    test "summary lenth shouldnt be shout" do
        @recipe.summary="a"*9
        assert_not @recipe.valid?
    end
    # description !>500
    test "description should be present" do
        @recipe.description="a"*501
        assert_not @recipe.valid?
    end
    # descriptiion != null 
    test "description shouldnot be too long" do
        @recipe.description=" "
        assert_not @recipe.valid?
    end
    # description  should not be less than tweny 
    test "description should not be too short" do
        @recipe.description="a"*19
        assert_not @recipe.valid?
    end


end
