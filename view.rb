class View
  def display(info_from_repo)
    info_from_repo.each_with_index do |item, index|
      p item
      box = display_check_mark(item)
      puts "#{index + 1}. #{box} #{item.name} - (#{item.prep_time})"
    end
   end

  def get_new
    puts 'Pick a name for your recipe'
    recipe_name = gets.chomp
    puts 'Describe your recipe in a few words'
    description = gets.chomp
    puts "Enter the preptime of your recipe (in minutes)"
    preptime = gets.chomp
    puts "Good choice, I just added the #{recipe_name} recipe to the cookbook"
    return new_val = [recipe_name, description, preptime]
  end

  def destroy(info_from_repo)
    display(info_from_repo)
    puts "Enter the corresponding number of the recipe you would like to destroy: "
    user_input = gets.chomp.to_i
    user_input -= 1
    display_obj = info_from_repo[user_input]
    puts "O.K, I removed #{display_obj.name} from the cookbook"
    return user_input
  end

  def search_term
    puts "What ingredient would you like a recipe for?"
    user_input = gets.chomp
    puts "looking for #{user_input} on letscookfrench..."
    return user_input
  end

  def get_option
    puts "Enter the index of the recipe you would like to save"
    user_input = gets.chomp.to_i
    puts "Great, I added your choice to the cookbook"
    user_input -= 1
  end

  def display_check_mark(instance)  
    check_box = "[X]"
    if instance.box_check != true  
      check_box = "[]"
    end
    return check_box
  end
  

  def check(info_from_repo)
    display(info_from_repo)
    puts "pick a recipe to mark off: "
    user_input = gets.chomp.to_i
    "Recipe has been checked off"
    user_input -= 1
  end
end

