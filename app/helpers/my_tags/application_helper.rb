module MyTags
  module ApplicationHelper

    def tags_field_tag(object)
      html_value = object.tags.blank? ? nil : (object.tags.map(&:name).join(', ') + ', ')
      text_field_tag "#{object.class.to_s.downcase}[tag_list]", html_value, placeholder: 'Tags', class: 'my_taggable', 'data-tags_list_path' => my_tags_list_path
    end

    def tag_list(obj, opts = {})
      content_tag :div, class: opts.fetch(:html_class, nil) do
        obj.tags.map do |tag|
          content_tag :a, href: tag_path(tag.name) do
            tag.name
          end
        end.join(', ').html_safe
      end.html_safe
    end

  end
end
