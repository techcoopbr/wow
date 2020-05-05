class GameDeveloper < ApplicationRecord
  belongs_to :game
  belongs_to :developer


  def self.existent_relation?(game, developer)
    GameDeveloper.where(game: game, developer: developer).exists?
  end

  def self.create_developer_relation(game, info)
    return if info.nil?
    info.each do |dev_name|
      dev = Developer.get_or_create_steam_developer(dev_name)
      GameDeveloper.new(game: game, developer: dev).save if not GameDeveloper.existent_relation?(game, dev)
    end
  end


end
