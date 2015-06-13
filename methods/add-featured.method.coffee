'use strict'

Meteor.methods
  addFeatured: (listing) ->
    today = new Date()
    today.setHours 0
    today.setMinutes 0
    today.setSeconds 0
    today.setMilliseconds 0
    featured = Featured.find(day:today).fetch()
    if featured.length < 4 and listing
      listing.day = today
      Featured.insert _.omit listing, '$$hashKey'
    return