'use strict'

Meteor.publish 'blog', (options, searchString) ->
  if !searchString
    searchString = ''
  Counts.publish this, 'numberOfBlog', Blog.find(
    'name':
      '$regex': '.*' + searchString or '' + '.*'
      '$options': 'i'
  ), noReady: true
  Blog.find {
    'name':
      '$regex': '.*' + searchString or '' + '.*'
      '$options': 'i'
  }, options