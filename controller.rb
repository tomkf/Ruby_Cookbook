#  It will also ask the view for information to create new recipes. (instance methods)

# The controller will gather data from the repo to hand them over to the view.

# # CONTROLLER:
# The controller will gather data from the cookbook to hand them over to the view.
# It will also ask the view for information to create new recipes.
require_relative 'recipe_model'

class Controller # holds reference to the repo and the view
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
   end

  def list
    info_to_display = @cookbook.all # return the array from the repo
    @view.display(info_to_display) # send it to the view to display
   end

  def create # needs to take a "recipe" from the view...in order to pass to the repo
    user_input = @view.get_new # this will be a hash,created in the view...now send that to repo
   created_recipe = Recipe.new(user_input[0], user_input[1])
    @cookbook.add_recipe(created_recipe)
  end

  def destroy; end
end
