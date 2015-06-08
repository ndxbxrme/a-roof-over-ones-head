@Hidden = new Mongo.Collection('hidden')

Hidden.allow
  insert: (userId, hidden) ->
    userId
  update: (userId, hidden, fields, modifier) ->
    userId
  remove: (userId, hidden) ->
    userId
