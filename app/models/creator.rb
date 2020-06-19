class Creator < ApplicationRecord
  validates_uniqueness_of :slug, :user_id
  belongs_to :user
  has_many :game_creators
  has_many :games, through: :game_creators
  has_many :creator_tags
  has_many :tags, through: :creator_tags
  has_many :blogs
  has_many :posts_comments, through: :blogs, source: :comments
  has_many :posts_anonymous_comments, through: :blogs, source: :anonymous_comments

  mount_uploader :photo, PhotoUploader
  mount_uploader :photo_box, PhotoBoxUploader
  mount_uploader :cover, CoverUploader
  mount_uploader :publi_file, FileUploader
  mount_uploader :contact_file, FileUploader
  mount_uploader :meta_photo, PhotoUploader

  is_impressionable counter_cache: true
  validates :page_name, :about, presence: true

  def self.streamers
    where.not(twitch: ["", nil])
  end

  def self.get_twitch_logins
    logins = Array.new
    streamers.each do |s|
      if s.twitch.split('/')[-1] == ''
        logins << s.twitch
      else
        logins << s.twitch.split('/')[-1]
      end
    end
    logins
  end

  def self.find_by_twitch(name)
    name_str = '%' + name.downcase.to_s + '%'
    find_by("twitch ilike ? ", name_str )
  end

  def self.game_with(name)
    Game.find_by!(name: name).creators
  end

  def self.game_counts
    Game.select('games.*, count(game_creators.game_id) as count').joins(:game_creators).group('game_creators.game_id')
  end

  def self.with_twitter
    where.not(twitter: nil)
  end

  def self.start_last_tweet_update
    begin
      with_twitter.each do |creator|
        UpdateLastTweetJob.perform_later(creator)
      end
    rescue
    end
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

  def update_last_tweet
    id = self.new_last_tweet_id

    if self.last_tweet_id != id
      self.last_tweet_id = id
      self.save
    end
  end

  def new_last_tweet_id
    TwitterRestClient.new_client.get_last_tweet(self).id
  end

end
