class GameDeveloper < ApplicationRecord
  validates :game_id, uniqueness: { scope: [:developer_id] } 
  belongs_to :game
  belongs_to :developer


  def self.existent_relation?(game, developer)
    GameDeveloper.where(game: game, developer: developer).exists?
  end

  def self.create_developer_relation(game, info)
    return if info.nil?
    info.each do |dev_name|
      dev = Developer.get_or_create_steam_developer(dev_name)
      gd = GameDeveloper.new(game: game, developer: dev)
      gd.save if gd.valid?
    end
  end


end
