'use strict'

Meteor.publish 'favorites', (options, searchString) ->
  Counts.publish this, 'numberOfFavorites', Favorites.find(
    'userId': @userId
  ), noReady: true
  Favorites.find {
    'userId': @userId
  }, options