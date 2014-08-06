require 'spec_helper'

describe "Managing tags via names" do
  let(:article) { Article.create }

  it "returns tag names" do
    article.tags << MyTags::Tag.create(:name => 'melbourne')

    article.tag_list.to_a.should == ['melbourne']
  end

  it "adds tags via their names" do
    article.tag_list << 'melbourne'

    article.tags.collect(&:name).should == ['melbourne']
  end

  it "accepts a completely new set of tags" do
    article.tag_list = ['portland', 'oregon']

    article.tags.collect(&:name).should == ['portland', 'oregon']
  end

  it "enumerates through tag names" do
    article.tag_list = ['melbourne', 'victoria']
    names = []

    article.tag_list.each do |name|
      names << name
    end

    names.should == ['melbourne', 'victoria']
  end

  it "does not allow duplication of tags" do
    existing = Article.create
    existing.tags << MyTags::Tag.create(:name => 'portland')

    article.tag_list = ['portland']

    existing.tag_ids.should == article.tag_ids
  end

  it "appends tag names" do
    article.tag_list  = ['portland']
    article.tag_list += ['oregon', 'ruby']

    article.tags.collect(&:name).should == ['portland', 'oregon', 'ruby']
  end

  it "removes a single tag name" do
    article.tag_list = ['portland', 'oregon']
    article.tag_list.delete 'oregon'

    article.tags.collect(&:name).should == ['portland']
  end

  it "removes tag names" do
    article.tag_list  = ['portland', 'oregon', 'ruby']
    article.tag_list -= ['oregon', 'ruby']

    article.tags.collect(&:name).should == ['portland']
  end
end
