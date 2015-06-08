@Favorites = new Mongo.Collection('favorites')

Favorites.allow
  insert: (userId, favorite) ->
    userId
  update: (userId, favorite, fields, modifier) ->
    userId
  remove: (userId, favorite) ->
    userId
