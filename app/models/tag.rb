class Tag < ApplicationRecord
  has_many :taggings
  has_many :blogs, through: :taggings

  has_many :creator_tags
  has_many :creators, through: :creator_tags

  def self.counts
    self.select("name, count(taggings.tag_id) as count").joins(:taggings).group("taggings.tag_id")
  end
end
