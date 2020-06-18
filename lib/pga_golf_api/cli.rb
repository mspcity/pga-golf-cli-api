class CLI

  def launch
    puts ""
    # API.get_players
    
    print_main_menu
  end

  def print_main_menu
    puts "Wecome to the PGA Golf data"
    puts ""
    puts "Press 1 to list all the players"
    puts "Press 2 to find the player by first name"
    puts "Press 3 to find the player by letter"
    puts "Press 4 to find the player by country"
    puts "or type 'exit' to exit the program"
    main_memu
  end

  def main_memu
    input = gets.strip
    if input == "1"
      puts "==========================================N O W   L O A D I N G=============================================="
      puts "Please wait while we are loading your data. Thank you for your patience."
    progress = "Loading ["
    1000.times do |i|
      p = i + 1
      if p % 10 == 0
        progress << "="
        print "\r"
        print progress + " #{p / 10}%"
        $stdout.flush
        sleep 0.05
      end
    end
    puts "\nDone!"
    puts "Here is your data" 
      print_all_players
    elsif input == "2"
      find_player_by_first_name
    elsif input == "3"
      find_player_by_letter
    elsif input == "4"
      find_player_by_country
    elsif input == 'exit'
      puts ""
      puts "Good bye"
      exit
    else
      puts "wrong input"
      puts ""
      print_main_menu
    end
  end

  def print_all_players
    Player.all.each.with_index(1) do |player, index|
      puts "#{index}. #{player.first_name} #{player.last_name}"
      # binding.pry
    end
      puts ""
      puts "Please enter the player's number that you want to know more"
      puts ""
      puts "Hit 'Enter Key' to go back to main menu"
      puts "or type 'exit' to exit the program"
      player_info
     
  end
  def find_player_by_letter
    puts "Please enter some letters start with"
    input = gets.strip.capitalize!
    Player.all.each do |player|
      if player.first_name.start_with?(input)
        puts "#{player.first_name} #{player.last_name}"
      end
    end
    print_main_menu
  end

  def find_player_by_country
    puts "Please enter the country:"
    input = gets.strip.upcase
    Player.all.each do |player|
      if player.country.start_with?(input)
        puts "#{player.first_name} #{player.last_name}"
      end
    end
    print_main_menu
  end


  def find_player_by_first_name
    puts "Please enter the name of a player:"
    input = gets.strip.capitalize!
    
      Player.all.each do |player| 
      if player.first_name == input
        puts "============================================================================================================="
        puts "#{player.first_name} #{player.last_name}"
        puts ""
        puts "Height: #{player.height} inches"
        puts "Weight: #{player.weight} lbs"
        puts "Birthday: #{player.birthday}"
        puts "Country: #{player.country}"
        puts "Residence: #{player.residence}"
        puts "Birth Place: #{player.birth_place}"
        puts "College: #{player.college}"
        puts "Turned pro: #{player.turned_pro}"
        puts ""
      end
    end
    print_main_menu
  end

  def player_info
    input = gets.strip.to_i

    if(1..Player.all.length).include?(input)
      player = Player.all[input-1]
      puts "============================================================================================================="
      puts "#{player.first_name} #{player.last_name}"
      puts ""
      puts "Height: #{player.height} inches"
      puts "Weight: #{player.weight} lbs"
      puts "Birthday: #{player.birthday}"
      puts "Country: #{player.country}"
      puts "Residence: #{player.residence}"
      puts "Birth Place: #{player.birth_place}"
      puts "College: #{player.college}"
      puts "Turned pro: #{player.turned_pro}"
      puts ""
    end
    print_main_menu
  end
  
end

