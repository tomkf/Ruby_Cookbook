# CONTROLLER HOLDS REFERENCE TO THIS

class View
  def display(info_from_repo)
    info_from_repo.each_with_index do |item, index|
      puts "#{index + 1}: #{item}"
    end
   end

  def get_new
  puts "Pick a name for your recipe"
  recipe_name = gets.chomp
  puts "O.K buddy, describe your recipe in a few words"
  description = gets.chomp
  puts "Good choice, I just added your reicpe to the cookbook"
  return {:name => recipe_name, :description => description}
  end
end
