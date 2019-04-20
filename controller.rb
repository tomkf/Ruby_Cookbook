#  It will also ask the view for information to create new recipes. (instance methods)

# The controller will gather data from the repo to hand them over to the view.

# # CONTROLLER:
# The controller will gather data from the cookbook to hand them over to the view.
# It will also ask the view for information to create new recipes.

class Controller # holds reference to the repo and the view
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
   end

  def list; end

  def create; end

  def destroy; end
end
