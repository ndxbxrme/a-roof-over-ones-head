'use strict'

Meteor.publish 'listings', (options, searchString) ->
  if !searchString
    searchString = ''
  Counts.publish this, 'numberOfListings', Listings.find(
    'name':
      '$regex': '.*' + searchString or '' + '.*'
      '$options': 'i'
  ), noReady: true
  Listings.find {
    'name':
      '$regex': '.*' + searchString or '' + '.*'
      '$options': 'i'
  }, options