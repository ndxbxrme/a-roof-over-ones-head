@Loves = new Mongo.Collection('loves')

Loves.allow
  insert: (userId, lofe) ->
    userId
  update: (userId, lofe, fields, modifier) ->
    userId
  remove: (userId, lofe) ->
    userId
