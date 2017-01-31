window.Binco.Select2 =
  load: (selector) ->
    selector = if typeof selector == 'string' then selector else '.select2-rails'
    $(selector).each((i,e) ->
      $(e).select2('destroy') if $(e).hasClass("select2-hidden-accessible")
      $(e).select2()
    )

$(document).on 'turbolinks:load', window.Binco.Select2.load
