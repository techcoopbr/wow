class Blog < ApplicationRecord
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  has_many :comments
  has_many :anonymous_comments
  belongs_to :creator

  extend FriendlyId
  friendly_id :title, use: :slugged
  mount_uploader :cover, BlogUploader
  validates :tags, :title, :short_description, :body, :cover, presence: true
  is_impressionable counter_cache: true

  def all_tags=(names)
    self.tags = names.split(",").map do |name|
        Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    self.tags.map(&:name).join(", ")
  end

  def self.tagged_with(name)
    Tag.find_by_name!(name).posts
  end

  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end
end
