json.set! :data do
  json.array! @meta do |metum|
    json.partial! 'meta/metum', metum: metum
    json.url  "
              #{link_to 'Show', metum }
              #{link_to 'Edit', edit_metum_path(metum)}
              #{link_to 'Destroy', metum, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end