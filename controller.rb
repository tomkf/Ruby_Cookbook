#  It will also ask the view for information to create new recipes. (instance methods)
#   Here are the methods to implement:

# The controller will gather data from the repo to hand them over to the view.

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
   end

  def list_all; end

  def create_new_recipe; end

  def destroy_recipe; end
end
