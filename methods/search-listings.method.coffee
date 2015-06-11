'use strict'

Meteor.methods
  searchListings: (location, listing_type, page) ->
    if Meteor.isServer
      future = new Future()
      HTTP.call 'GET', 'http://api.nestoria.co.uk/api?action=search_listings&encoding=json&place_name=' + location + '&page=' + page + '&listing_type=' + listing_type + '&number_of_results=50&sort=price_lowhigh', (err, data) ->
        future['return'] data
      future.wait()