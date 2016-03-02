window.Binco.Select2 =
  load: (selector) ->
    selector = if typeof selector == 'undefined' then '.select2-rails' else selector
    $(selector).select2()

$(document).ready window.Binco.Select2.load
$(document).on 'page:load', window.Binco.Select2.load
