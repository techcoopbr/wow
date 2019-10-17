class Creator < ApplicationRecord
  validates_uniqueness_of :slug, :user_id
  belongs_to :user

  mount_uploader :photo, PhotoUploader
  mount_uploader :cover, CoverUploader
  mount_uploader :publi_file, FileUploader
  mount_uploader :contact_file, FileUploader    
end
