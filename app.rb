require_relative 'repo' # You need to create this file!
require_relative 'controller' # You need to create this file!
require_relative 'router'
require 'csv'
require_relative 'view'
require_relative 'recipe_model'

csv_file   = File.join(__dir__, 'recipes.csv') # define file path for csv storage
cookbook   = Cookbook.new(csv_file)
controller = Controller.new(cookbook) # create the controller, give it the repo

router = Router.new(controller) # holds reference to the controller

# Start the app
router.run
