require_relative 'recipe_model'
require 'nokogiri'
require 'open-uri'


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
    created_recipe = Recipe.new(user_input[0], user_input[1], user_input[2])
    @cookbook.add_recipe(created_recipe)
  end

  def destroy
    info_to_display = @cookbook.all
    desired_index = @view.destroy(info_to_display)
    @cookbook.remove_recipe(desired_index)
   end

  def search
    user_input = @view.search_term
    query_string = "http://www.letscookfrench.com/recipes/find-recipe.aspx?aqt=#{user_input}"
    html_file = open(query_string).read # this is an HTML string
    html_doc = Nokogiri::HTML(html_file)
    array_to_transform = []

    name_arr = []
    html_doc.search('.m_titre_resultat a').each do |element|
      name = element.text.strip
      name_arr.push(name)
    end

    descrip_array = []
    html_doc.search('.m_detail_recette').each do |element|
      description = element.text.strip
      descrip_array.push(description)
    end

    prep_array = []
    html_doc.search('.m_detail_time').each do |element|
      prep_time = element.text.strip
      isolate = prep_time.match(/(\d\sh\s)|\d\d\smin/)
      prep_array.push(isolate)
    end

    array_to_transform.push(name_arr)
    array_to_transform.push(descrip_array)
    array_to_transform.push(prep_array)

    view_display = create_instances(array_to_transform) # array of instances
    @view.display(view_display)
    desired_input = @view.get_option # will get numeric value.....
    desired_instance = view_display[desired_input] # should be the correct instance....
    @cookbook.add_recipe(desired_instance)
  end

  def create_instances(array)
    array_of_instances = []
    counter = 0
    until counter == 5
      array_of_instances.push(Recipe.new(array[0][counter], array[1][counter], array[2][counter]))
      counter += 1
    end
    return array_of_instances
    end

  def mark_done
    info_to_display = @cookbook.all
    user_val = @view.check(info_to_display)
    desired_instance = info_to_display[user_val]
    re_write = desired_instance.check
  end
end
