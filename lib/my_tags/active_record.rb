module MyTags::ActiveRecord
  def self.included(base)
    base.extend MyTags::ActiveRecord::ClassMethods
  end

  def tag_list
    @tag_list ||= MyTags::TagList.new self
  end

  def tag_list=(names)
    @tag_names = names.is_a?(MyTags::TagList) ? names : MyTags::TagList.new_with_names(self, names)
  end

  # Add/Update tags for object
  # @post.process_tags('cat, dog')
  # @post.process_tags(['cat','dog'])
  def process_tags(tag_list)
    tag_list = tag_list.split(',').map(&:strip) unless tag_list.is_a?(Array)
    self.tag_list = tag_list
  end

  module ClassMethods
    def has_many_tags
      has_many :taggings, :class_name => 'MyTags::Tagging', :as => :taggable, :dependent => :destroy
      has_many :tags,     :class_name => 'MyTags::Tag', :through => :taggings
    end
  end
end
