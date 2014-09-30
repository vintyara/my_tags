Simple gem for Tags

Examples:

Gemfile:
  `gem 'my_tags'`

Your model, witch will be use Tags
`class Post < ActiveRecord::Base
  has_many_tags`


post = Post.create(name: 'Post with tags')
post.tags => []
post.tags.count => 0

post.tag_list << 'First tag'
post.tags.count => 1
post.tags.first.delete
post.tags.count => 0


===

UI

add to Routes.rb

mount MyTags::Engine, at: "/my_tags"


add to your applications.js:

//= require my_tags


= tags_field_tag(@post)