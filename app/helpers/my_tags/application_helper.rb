module MyTags
  module ApplicationHelper

    def tags_field_tag(object)
      text_field_tag "#{object.class.to_s.downcase}[tags]", nil, placeholder: 'Tags', class: 'taggable', 'data-tags_list_path' => my_tags_list_path
    end

  end
end
