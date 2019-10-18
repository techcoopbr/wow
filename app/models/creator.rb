class Creator < ApplicationRecord
  validates_uniqueness_of :slug, :user_id
  belongs_to :user
  has_many :game_creators
  has_many :games, through: :game_creators

  mount_uploader :photo, PhotoUploader
  mount_uploader :cover, CoverUploader
  mount_uploader :publi_file, FileUploader
  mount_uploader :contact_file, FileUploader




  def self.game_with(name)
    Game.find_by!(name: name).creators
  end

  def self.game_counts
    Game.select('games.*, count(game_creators.game_id) as count').joins(:game_creators).group('game_creators.game_id')
  end

  def game_list
    games.map(&:name).join(', ')
  end

  def game_list=(names)
    self.games = names.split(',').map do |n|
      Game.where(name: n.strip).first_or_create!
    end
  end
end
