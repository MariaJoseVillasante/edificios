json.extract! blog, :id, :title, :image_url, :content, :author, :status, :created_at, :updated_at
json.url blog_url(blog, format: :json)
