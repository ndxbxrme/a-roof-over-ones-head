@PropertyTags = new Mongo.Collection('propertyTags')

PropertyTags.allow
  insert: (userId, propertyTag) ->
    userId
  update: (userId, propertyTag, fields, modifier) ->
    userId
  remove: (userId, propertyTag) ->
    userId
