Meteor.startup ->
  if Favorites.find().count() == 0
    favorites = [
      {
        'name': 'favorite 1'
      }
      {
        'name': 'favorite 2'
      }
    ]
    favorites.forEach (favorite) ->
      Favorites.insert favorite