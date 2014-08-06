module MyTags::ActiveRecord
  def self.included(base)
    base.extend MyTags::ActiveRecord::ClassMethods
  end

  module ClassMethods
    def has_many_tags
      has_many :taggings, :class_name => 'MyTags::Tagging', :as => :taggable, :dependent => :destroy
      has_many :tags,     :class_name => 'MyTags::Tag', :through => :taggings
    end
  end
end
