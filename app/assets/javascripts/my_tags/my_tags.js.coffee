ready = ->
  if $('.my_taggable').length
    $('.my_taggable').keyup (elm) ->
      tags_separator = ','

      # Search by last separated word
      tags_arr = $(elm.target).val().split(tags_separator)
      search_string = tags_arr[tags_arr.length - 1].trim()

      $.ajax
        url: $(@).data('tags_list_path')
        type: "GET"
        dataType: "json"
        data: starts_with: search_string
        success: (response) ->
          tags_list_popup(response, elm.target)

tags_list_popup = (tag_list, object) ->
  popup_id = 'tags_popup'

  # Create or use existing Popup Window
  if $('#' + popup_id).length > 0
    popup_container = $('#' + popup_id)
  else
    popup_container = $("<div id='#{popup_id}'></div>")
    $(object).after(popup_container)


  # Show tag lists
  html_list = $('<ul/>')
  $.map tag_list, (tag) ->
    li = $('<li/>')
      .addClass('ui-menu-item')
      .attr('role', 'menuitem')
      .appendTo(html_list)

    a = $('<a/>')
      .addClass('ui-all')
      .text(tag.name)
      .appendTo(li)
    li.click ->
      already_filled_in_tags = $(object).val().split(',')
      already_filled_in_tags.pop()
      already_filled_in_tags.push(tag.name + ', ')
      $(object).val(already_filled_in_tags.join(', '))

      # Destroy popup after select tag
      popup_container.remove()

  popup_container.html(html_list)


$(document).ready(ready)
$(document).on('page:load', ready)