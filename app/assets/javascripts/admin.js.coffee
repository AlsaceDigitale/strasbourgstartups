#= require jquery
#= require jquery_ujs
#= require jquery-ui/sortable
#= require jquery-ui/effect-highlight
#= require jquery_nested_form
#= require bootstrap-sprockets
#= require moment
#= require moment/fr
#= require bootstrap-datetimepicker

$(document).ready ->
  # manage dependent fields method f.depend_on(:attribute, :value, &block)
  $('.dependent-fields').each () ->
    element = $(this)
    element.hide()
    depend_id = element.data('depend').id
    depend = $("[id=#{ depend_id }_id], [id=#{ depend_id }], [type=radio][id^=#{ depend_id }_], [type=checkbox][id^=#{ depend_id }_]")

    if depend.length
      depend.on('change', (e) ->
        node = $(this)

        value = if node.is("input[type=radio]")
          if depend.length > 1 && node.is(':checked') then node.val() else false
        else if node.is("input[type=checkbox]")
          if depend.length > 1 && node.is(':checked') then node.val() else node.is(':checked')
        else
          node.val()

        if (!( node.is("input[type=radio]") ) || node.is(':checked'))
          values = $.map $(element).data('depend').values, (n) ->
            n.toString()
          toggle = $.inArray(value.toString(), values) != -1
          element.toggle(toggle)
          if (toggle)
            $('input, textarea, select', element).prop('disabled', false)
          else
            $('input, textarea, select', element).prop('disabled', true)
      ).change()

  $('.observable input').on "change", () ->
    node = $(this)
    node.closest("form").submit()

  $('.observable').on 'ajax:success', (data, status, xhr) ->
    $(this).effect("highlight")

  $(".sortable").sortable
    stop: (e, ui) ->
      node = $(this)
      data = node.sortable("serialize")
      url = node.data("url")
      $.ajax
        type: "POST",
        url: url
        data: data
        dataType: 'script'
        success: (data, status, xhr) ->
          node.effect("highlight")

  $("[data-provide='datetimepicker']").datetimepicker
    locale: 'fr'
    format: 'YYYY-MM-DDTHH:mm:ss'

  $("[data-provide='datepicker']").datetimepicker
    locale: 'fr'
    format: 'YYYY-MM-DD'
