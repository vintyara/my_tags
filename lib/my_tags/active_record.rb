module MyTags::ActiveRecord
  def self.included(base)
    base.extend MyTags::ActiveRecord::ClassMethods
  end

  def tags
    @tags ||= MyTags::TagList.new self
  end

  def tags=(names)
    if names.is_a?(MyTags::TagList)
      @tag_names = names
    else
      @tag_names = MyTags::TagList.new_with_names self, names
    end
  end

  module ClassMethods
    def has_many_tags
      has_many :taggings, :class_name => 'MyTags::Tagging', :as => :taggable, :dependent => :destroy
      has_many :tags,     :class_name => 'MyTags::Tag', :through => :taggings
    end
  end
end
