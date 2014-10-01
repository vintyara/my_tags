module MyTags
  module ApplicationHelper

    def tags_field_tag(object)
      html_value = object.tags.blank? ? nil : (object.tags.map(&:name).join(', ') + ', ')
      text_field_tag "#{object.class.to_s.downcase}[tag_list]", html_value, placeholder: 'Tags', class: 'my_taggable', 'data-tags_list_path' => my_tags_list_path
    end

    # Show all object tags
    def tag_list(obj, opts = {})
      content_tag :div, class: opts.fetch(:html_class, nil) do
        tag_list_with_link(obj.tags)
      end.html_safe
    end

    # Show all tags
    def all_tags(opts = {})
      content_tag :div, class: opts.fetch(:html_class, nil) do
        tag_list_with_link(Tag.uniq(:name))
      end.html_safe
    end

    def tag_list_with_link(tag_list)
      tag_list.map do |tag|
        content_tag :a, href: tag_path(tag.name) do
          tag.name.capitalize
        end
      end.join(', ').html_safe
    end

  end
end
