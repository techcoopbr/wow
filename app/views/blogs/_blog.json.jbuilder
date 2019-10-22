json.extract! blog, :id, :title, :body, :creator_id, :tags, :created_at, :updated_at
json.url blog_url(blog, format: :json)
