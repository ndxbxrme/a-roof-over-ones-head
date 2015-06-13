Meteor.startup ->
  if Featured.find().count() == 0
    featured = [
      {
        'name': 'featured 1'
      }
      {
        'name': 'featured 2'
      }
    ]
    featured.forEach (featured) ->
      Featured.insert featured