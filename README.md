## Simple gem for Tags

###Allow add Tags for any model

#####Examples:

Add `gem 'my_tags'` to Gemfile

Add `has_many_tags` for model, which you want to use tags

```
class Post < ActiveRecord::Base
has_many_tags
```

Run rake `my_tags:install:migrations` and `rake:db:migrate`

Done!

###### Done, ready for using:

post = Post.create(name: 'Post with tags')

post.tags => []

post.tags.count => 0

post.tag_list << 'First tag'

post.tags.count => 1

post.tags.first.delete

post.tags.count => 0

Or you can use this method:

`@post.process_tags('animals, pets')` or `@post.process_tags(['animals', ['pets'])` 


### UI features:

Add to Routes.rb `mount MyTags::Engine, at: "/my_tags"`


Add to your applications.js: `//= require my_tags`

Use `= tags_field_tag(@post)` helpers method in views (it draw input field with autocompete popup)