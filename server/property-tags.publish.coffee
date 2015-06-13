'use strict'

Meteor.publish 'propertyTags', () ->
  PropertyTags.find
    'user': @userId