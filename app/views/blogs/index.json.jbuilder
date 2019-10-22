json.set! :data do
  json.array! @blogs do |blog|
    json.partial! 'blogs/blog', blog: blog
    json.url  "
              #{link_to 'Show', blog }
              #{link_to 'Edit', edit_blog_path(blog)}
              #{link_to 'Destroy', blog, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end