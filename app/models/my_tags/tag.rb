class MyTag::Tag < ActiveRecord::Base
  has_many :taggings, :class_name => 'MyTags::Tagging', :dependent => :destroy

  validates :name, :presence => true, :uniqueness => true
end
