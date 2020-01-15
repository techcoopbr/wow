json.set! :data do
  json.array! @developers do |developer|
    json.partial! 'developers/developer', developer: developer
    json.url  "
              #{link_to 'Show', developer }
              #{link_to 'Edit', edit_developer_path(developer)}
              #{link_to 'Destroy', developer, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end