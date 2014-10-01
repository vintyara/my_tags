module MyTags
  class TagsController < MyTags::ApplicationController
    respond_to :html, :xml, :json

    def list
      respond_with (params[:starts_with].blank? ? Tag.all : Tag.where("name LIKE '#{params[:starts_with]}%'"))
    end

    def tag
      tag = Tag.find_by_name(params[:tag])
      @taggables = tag.taggings.map(&:taggable)
    end
  end
end