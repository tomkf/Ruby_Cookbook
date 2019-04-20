# CONTROLLER HOLDS REFERENCE TO THIS

class View
  def display(info_from_repo)
    info_from_repo.each_with_index do |item, index|
      puts "#{index + 1}: #{item.name}"
    end
   end

  def get_new
    puts 'Pick a name for your recipe'
    recipe_name = gets.chomp
    puts 'O.K buddy, describe your recipe in a few words'
    description = gets.chomp
    puts 'Good choice, I just added your reicpe to the cookbook'
    return new_val = [recipe_name, description]
  end

def destroy(info_from_repo)
display(info_from_repo)
puts "Enter the corresponding number of the recipe you would like to destroy: "
user_input = gets.chomp.to_i 
user_input += 1
puts "O.K, I removed #{info_from_repo[user_input]} from the cookbook"
end

end
