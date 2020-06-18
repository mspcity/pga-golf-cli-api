class Player
  
  attr_accessor :first_name, :last_name, :height, :weight, :birthday, 
  :country, :residence, :birth_place, :college, :turned_pro

  @@all = []
 
  def initialize(first_name:, last_name:, height:, weight:, birthday:,
    country:, residence:, birth_place:, college:, turned_pro:)

    self.first_name = first_name
    self.last_name = last_name
    self.height = height
    self.weight = weight
    self.birthday = birthday
    self.country = country
    self.residence = residence
    self.birth_place = birth_place
    self.college = college
    self.turned_pro = turned_pro

    self.save
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end


end







