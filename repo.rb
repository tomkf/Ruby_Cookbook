require_relative 'recipe_model'

class Cookbook
  attr_reader :local_storage, :csv_file_path
  attr_accessor :local_storage, :csv_file_path
  def initialize(csv_file_path = nil)
    @csv_file_path = csv_file_path
    @local_storage = []
    CSV.foreach(@csv_file_path) do |row|  #write to the local storage at start...fill array
    @local_storage.push(Recipe.new(row[0], row[1]))
    end
   end

  def all
    @local_storage  
  end

  def add_recipe(recipe)  #controller will give an instance obj. so write to CSV with this
    @local_storage.push(recipe)
      CSV.open(@csv_file_path, "a") do |csv|
        csv << [recipe.name, recipe.description]
    end
  end

  def remove_recipe(recipe_index) #controller will give an instance obj.
    if csv_file_path == nil
    @local_storage.delete_at(recipe_index)
   else 

   end
  end
 end

