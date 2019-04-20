require_relative 'recipe_model'

class Controller 
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
   end

  def list
    info_to_display = @cookbook.all 
    @view.display(info_to_display) 
   end

  def create 
    user_input = @view.get_new 
   created_recipe = Recipe.new(user_input[0], user_input[1])
    @cookbook.add_recipe(created_recipe)
  end

  def destroy
    info_to_display = @cookbook.all
    desired_index = @view.destroy(info_to_display)
    @cookbook.remove_recipe(desired_index)
   end
end
