@Loves = new Mongo.Collection('loves')

Loves.allow
  insert: (userId, love) ->
    userId
  update: (userId, love, fields, modifier) ->
    userId
  remove: (userId, love) ->
    userId
