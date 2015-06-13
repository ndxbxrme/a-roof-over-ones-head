'use strict'

Meteor.publish 'boardProperty', (userId, tag) ->
  console.log userId, tag
  Favorites.find
    'userId': userId
    'tags.text': tag