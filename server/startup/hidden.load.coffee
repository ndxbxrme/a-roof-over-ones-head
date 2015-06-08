Meteor.startup ->
  if Hidden.find().count() == 0
    hidden = [
      {
        'name': 'hidden 1'
      }
      {
        'name': 'hidden 2'
      }
    ]
    hidden.forEach (hidden) ->
      Hidden.insert hidden