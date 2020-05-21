class Publisher < ApplicationRecord
  has_many :game_publishers

  def self.get_or_create_steam_publisher(name)    
    pub = Publisher.find_by(name: name)

    if pub.nil?
      pub = Publisher.new(name: name)
      pub.save
    end

    pub
  end
end
