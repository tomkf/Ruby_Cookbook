class Cookbook
  attr_reader :local_storage, :csv_file_path
  attr_accessor :local_storage, :csv_file_path
  def initialize(csv_file_path = nil)
    @csv_file_path = csv_file_path
    @local_storage = []
   end

  def all
    @local_storage
  end

  def add_recipe(recipe)
    @local_storage.push(recipe)
  end

  def remove_recipe(recipe_index)
    @local_storage.delete_at(recipe_index)
  end
 end
