'use strict'

Meteor.publish 'hidden', (options, searchString) ->
  Counts.publish this, 'numberOfHidden', Hidden.find(
    'userId': @userId
  ), noReady: true
  Hidden.find {
    'userId': @userId
  }, options