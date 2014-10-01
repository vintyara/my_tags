Rails.application.routes.draw do
  get '/my_tags/list', to: 'my_tags/tags#list'
  get '/tag/:tag', to: 'my_tags/tags#tag', as: 'tag'
end