module MyTags
  class TagsController < MyTags::ApplicationController
    respond_to :html, :xml, :json

    def list
      respond_with (params[:starts_with].blank? ? Tag.all : Tag.where("name LIKE '#{params[:starts_with]}%'"))
    end
  end
end