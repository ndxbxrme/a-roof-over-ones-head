@Blog = new Mongo.Collection('blog')

Blog.allow
  insert: (userId, blog) ->
    true
  update: (userId, blog, fields, modifier) ->
    true
  remove: (userId, blog) ->
    true
