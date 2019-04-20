require_relative 'repo' 
require_relative 'controller' 
require_relative 'router'
require 'csv'
require_relative 'view'
require_relative 'recipe_model'

csv_file   = File.join(__dir__, 'recipes.csv') 
cookbook   = Cookbook.new(csv_file)
controller = Controller.new(cookbook) 

router = Router.new(controller) 

# Start the app
router.run
