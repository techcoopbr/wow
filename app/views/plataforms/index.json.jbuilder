json.set! :data do
  json.array! @plataforms do |plataform|
    json.partial! 'plataforms/plataform', plataform: plataform
    json.url  "
              #{link_to 'Show', plataform }
              #{link_to 'Edit', edit_plataform_path(plataform)}
              #{link_to 'Destroy', plataform, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end