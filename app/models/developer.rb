class Developer < ApplicationRecord
  has_many :game_developers


  def self.new_steam_developer(name)
    dev = Developer.new(name: name)

    dev
  end

  def self.get_steam_developer(name)    
    dev = Developer.find_by(name: name)

    if not dev
      dev = new_steam_developer(name)
      dev.save
    end

    dev
  end

end
