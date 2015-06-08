Meteor.startup ->
  if Listings.find().count() == 0
    listings = [
      {
        'name': 'listing 1'
      }
      {
        'name': 'listing 2'
      }
    ]
    listings.forEach (listing) ->
      Listings.insert listing