class MyTags::Tags

  include Enumerable

  def initialize(taggable)
    @taggable = taggable
  end

  def to_a
    taggable.tags.collect &:name
  end

  def <<(name)
    tag = MyTags::Tag.where(:name => name).first_or_create
    taggable.tags << tag
  end

  def delete(name)
    taggable.tags.delete MyTags::Tag.where(:name => name).first
  end

  def +(array)
    array.each { |name| self.<< name }
    self
  end

  def -(array)
    array.each { |name| self.delete name }
    self
  end

  def self.new_with_names(taggable, names)
    tag_names = new(taggable)
    tag_names.clear
    names.each { |name| tag_names << name }
    tag_names
  end

  def clear
    taggable.tags.clear
  end

  def each(&block)
    to_a.each &block
  end

  private

  attr_reader :taggable
end
