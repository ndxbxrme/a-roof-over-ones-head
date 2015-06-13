Meteor.startup ->
  if Blog.find().count() == 0
    blog = [
      {
        'name': 'blog 1'
      }
      {
        'name': 'blog 2'
      }
    ]
    blog.forEach (blog) ->
      Blog.insert blog