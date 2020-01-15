class Creator < ApplicationRecord
  validates_uniqueness_of :slug, :user_id
  belongs_to :user
  has_many :game_creators
  has_many :games, through: :game_creators
  has_many :creator_tags
  has_many :tags, through: :creator_tags

  mount_uploader :photo, PhotoUploader
  mount_uploader :photo_box, PhotoBoxUploader
  mount_uploader :cover, CoverUploader
  mount_uploader :publi_file, FileUploader
  mount_uploader :contact_file, FileUploader
  mount_uploader :meta_photo, PhotoUploader

  validates :photo, :page_name, :about, presence: true

  def self.game_with(name)
    Game.find_by!(name: name).creators
  end

  def self.game_counts
    Game.select('games.*, count(game_creators.game_id) as count').joins(:game_creators).group('game_creators.game_id')
  end

  def game_list
    games.map(&:name).join(', ')
  end

  def all_tags=(names)
    self.tags = names.split(",").map do |name|
        Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    self.tags.map(&:name).join(", ")
  end  

  def game_list=(names)
    self.games = names.split(',').map do |n|
      Game.where(name: n.strip).first_or_create!
    end
  end
end
