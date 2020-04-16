json.set! :data do
  json.array! @publishers do |publisher|
    json.partial! 'publishers/publisher', publisher: publisher
    json.url  "
              #{link_to 'Show', publisher }
              #{link_to 'Edit', edit_publisher_path(publisher)}
              #{link_to 'Destroy', publisher, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end