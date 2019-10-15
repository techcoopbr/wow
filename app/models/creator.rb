class Creator < ApplicationRecord
  validates_uniqueness_of :slug, :user_id
  belongs_to :user
end
