Rails.application.routes.draw do
  get '/my_tags/list', to: 'my_tags/tags#list'
end