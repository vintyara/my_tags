require 'rails/engine'

class MyTags::Engine < Rails::Engine
  engine_name :my_tags

  ActiveSupport.on_load :active_record do
    include MyTags::ActiveRecord
  end
end
