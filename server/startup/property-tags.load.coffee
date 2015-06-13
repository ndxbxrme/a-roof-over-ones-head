Meteor.startup ->
  if PropertyTags.find().count() == 0
    propertyTags = [
      {
        'name': 'propertyTag 1'
      }
      {
        'name': 'propertyTag 2'
      }
    ]
    propertyTags.forEach (propertyTag) ->
      PropertyTags.insert propertyTag