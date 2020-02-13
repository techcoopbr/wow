class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :blog

  validate :user_id, :blog_id, presence: true	
end
