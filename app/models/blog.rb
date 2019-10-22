class Blog < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  mount_uploader :cover, BlogUploader

  validates :tags, :title, :short_description, :body, :cover, presence: true

  belongs_to :creator

  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end
end
