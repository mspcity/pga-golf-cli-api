class API

  BASE_URL = "https://api.sportradar.us/golf-t2/"
  # extra key: xw7qkuaud7nvkmubzcm7zqar
  def self.get_players
    response = RestClient.get(BASE_URL + "profiles/pga/2020/players/profiles.json?api_key=dtmh35fj7ewphrsk6vfxngm6")
    # response = RestClient.get(BASE_URL + "players/wgr/2020/rankings.json?api_key=nrhemff4kadrvt26cur675zp")
    data = JSON.parse(response)
    
    
    data["players"].each do |players_data|
      first_name = players_data["first_name"]
      last_name = players_data["last_name"]
      height = players_data["height"]
      weight = players_data["weight"]
      birthday = players_data["birthday"]
      country = players_data["country"]
      residence = players_data["residence"]
      birth_place = players_data["birth_place"]
      college = players_data["college"]
      turned_pro = players_data["turned_pro"]

      Player.new(
        first_name: first_name,  
        last_name: last_name,
        height: height,
        weight: weight,
        birthday: birthday,
        country: country,
        residence: residence,
        birth_place: birth_place,
        college: college,
        turned_pro: turned_pro
      )
    # binding.pry
    end
    # binding.pry
  end

  
end

