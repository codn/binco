window.Binco.Select2 =
  load: (selector) ->
    selector = if typeof selector == 'string' then selector else '.select2-rails'
    $(selector).select2()

$(document).on 'ready page:load', window.Binco.Select2.load
