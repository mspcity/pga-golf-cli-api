class CLI

  def launch
    puts ""
    # API.get_players
    
    print_main_menu
  end

  def print_main_menu
    puts "press 1 to list out players"
    puts "press 2 to find the player by first name"
    puts "press 3 to find the player by letter"
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
    elsif input == 'exit'
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
      puts "or type 'exit' to exit the program"
      player_info
     
  end
  def find_player_by_letter
    puts "some letter"
    input = gets.strip.capitalize!
    Player.all.each do |player|
      if  player.first_name.start_with?(input)
        puts "#{player.first_name} #{player.last_name}"
        
      end
    end
    print_main_menu
  end

  def find_player_by_first_name
    puts "Please enter the name of an player:"
    input = gets.strip.capitalize!
    
      Player.all.each do |player| 
      # player = Player.all[input]
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

