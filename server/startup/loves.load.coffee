Meteor.startup ->
  if Loves.find().count() == 0
    loves = [
      {
        'name': 'lofe 1'
      }
      {
        'name': 'lofe 2'
      }
    ]
    loves.forEach (love) ->
      Loves.insert love