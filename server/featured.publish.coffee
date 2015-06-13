'use strict'

Meteor.publish 'featured', () ->
  Featured.find {},
    'sort': {'day': -1}
    'limit': 4