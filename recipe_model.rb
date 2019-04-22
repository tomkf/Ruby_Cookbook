class Recipe
  attr_reader :name, :description, :prep_time, :box_check
  attr_writer :box_check
  def initialize(name, description, prep_time, box_check = false)
    @name = name
    @description = description
    @prep_time = prep_time
    @box_check = box_check
  end

  def check
    @box_check = true
  end
end
