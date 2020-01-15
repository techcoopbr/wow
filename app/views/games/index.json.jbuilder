json.set! :data do
  json.array! @games do |game|
    json.partial! 'games/game', game: game
    json.url  "
              #{link_to 'Show', game }
              #{link_to 'Edit', edit_game_path(game)}
              #{link_to 'Destroy', game, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end