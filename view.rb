# CONTROLLER HOLDS REFERENCE TO THIS

class View

  def display(info_from_repo)
    info_from_repo.each do |item|
      puts item
    end
   end


end
