json.set! :data do
  json.array! @creators do |creator|
    json.partial! 'creators/creator', creator: creator
    json.url  "
              #{link_to 'Show', creator }
              #{link_to 'Edit', edit_creator_path(creator)}
              #{link_to 'Destroy', creator, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end