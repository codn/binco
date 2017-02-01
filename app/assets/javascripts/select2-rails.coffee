window.Binco.Select2 =
  load: (selector) ->
    selector = if typeof selector == 'string' then selector else '.select2-rails'
    $(selector).select2()
  destroy: (selector) ->
    selector = if typeof selector == 'string' then selector else '.select2-rails'
    $(selector).each((i,e) ->
      $(e).select2('destroy')
    )

$(document).on 'turbolinks:load', window.Binco.Select2.load
$(document).on 'turbolinks:before-cache', window.Binco.Select2.destroy
