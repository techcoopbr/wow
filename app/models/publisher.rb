class Publisher < ApplicationRecord
  has_many :game_publishers


  def self.new_steam_publisher(name)
    pub = Publisher.new(name: name)

    pub
  end

  def self.get_steam_publisher(name)    
    pub = Publisher.find_by(name: name)

    if not pub
      pub = new_steam_publisher(name)
      pub.save
    end

    pub
  end
end
