class GameDeveloper < ApplicationRecord
  belongs_to :game
  belongs_to :developer


  def self.existent_relation?(game, developer)
    GameDeveloper.where(game: game, developer: developer).exists?
  end

  def self.create_developer_relation(game, info)
    info.each do |dev_name|
      dev = Developer.get_steam_developer(dev_name)

      if not GameDeveloper.existent_relation?(game, dev)
        GameDeveloper.new(game: game, developer: dev).save
      end

    end
  end


end
