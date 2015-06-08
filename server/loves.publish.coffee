'use strict'

Meteor.publish 'loves', (options, searchString) ->
  if !searchString
    searchString = ''
  Counts.publish this, 'numberOfLoves', Loves.find(
    'name':
      '$regex': '.*' + searchString or '' + '.*'
      '$options': 'i'
  ), noReady: true
  Loves.find {
    'name':
      '$regex': '.*' + searchString or '' + '.*'
      '$options': 'i'
  }, options