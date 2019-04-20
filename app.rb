require_relative 'cookbook'    # You need to create this file!
require_relative 'controller'  # You need to create this file!
require_relative 'router'
require 'csv'
require_relative 'view'
require_relative 'recipe'


csv_file   = File.join(__dir__, 'recipes.csv')
cookbook   = Cookbook.new(csv_file)
controller = Controller.new(cookbook)

router = Router.new(controller)

# Start the app
router.run




# VIEW:
# The view is responsible for all the puts and gets of your code.
# Make sure you never have those words anywhere else! (except maybe for debugging)

# # CONTROLLER:
# The controller will gather data from the cookbook to hand them over to the view.
# It will also ask the view for information to create new recipes. Here are the methods to implement:

