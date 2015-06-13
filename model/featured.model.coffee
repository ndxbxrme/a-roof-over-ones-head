@Featured = new Mongo.Collection('featured')

Featured.allow
  insert: (userId, featured) ->
    userId
  update: (userId, featured, fields, modifier) ->
    userId
  remove: (userId, featured) ->
    userId
