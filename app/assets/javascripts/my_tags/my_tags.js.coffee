ready = ->
  if $('.taggable').length
    $('.taggable').keyup (elm) ->
      $.ajax
        url: $(@).data('tags_list_path')
        type: "GET"
        dataType: "json"
        data: starts_with: $(elm.target).val()
        success: (response) ->
          tags_list_popup(response, elm.target)

tags_list_popup = (tag_list, object) ->
  console.log object
  popup_container = document.createElement('div')
  popup_container.innerHTML = "<h1>Привет!</h1>"
  object.insertBefore(popup_container)



$(document).ready(ready)
$(document).on('page:load', ready)