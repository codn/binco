$.fn.twitter_bootstrap_confirmbox =
  defaults:
    title: null
    proceed: "OK"
    proceed_class: "btn"
    cancel: "Cancelar"
    cancel_class: "btn"

TwitterBootstrapConfirmBox = (message, element, callback) ->

  $dialog = $("""
    <div class="modal fade" id="confirmation_dialog" role="dialog" tabindex="-1">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
            <h4 class="modal-title"></h4>
          </div>
          <div class="modal-body"></div>
          <div class="modal-footer"></div>
        </div>
      </div>
    </div>
  """)

  $dialog
    .find(".modal-header")
      .find(".modal-title")
        .html(element.data("confirm-title") || $.fn.twitter_bootstrap_confirmbox.defaults.title || window.top.location.origin)
      .end()
    .end()

    .find(".modal-body")
      .html(message.toString().replace(/\n/g, "<br />"))
    .end()

    .find(".modal-footer")
      .append(
        $("<a />", { href: "#", "data-dismiss": "modal" })
          .html(element.data("confirm-cancel") || $.fn.twitter_bootstrap_confirmbox.defaults.cancel)
          .addClass($.fn.twitter_bootstrap_confirmbox.defaults.cancel_class)
          .addClass(element.data("confirm-cancel-class") || "btn-default")
          .click((event) ->
            event.preventDefault()
            $dialog.modal("hide")
          )
        ,
        $("<a />", { href: "#" })
          .html(element.data("confirm-proceed") || $.fn.twitter_bootstrap_confirmbox.defaults.proceed)
          .addClass($.fn.twitter_bootstrap_confirmbox.defaults.proceed_class)
          .addClass(element.data("confirm-proceed-class") || "btn-warning")
          .click((event) ->
            event.preventDefault()
            $dialog.modal("hide")
            callback()
          )
      )
    .end()
    
    .on('keypress', (e) ->
      $('.modal-footer a:last').trigger('click') if e.keyCode == 13 # Enter Key Code
    )

    .on("hidden", -> $(@).remove())

    .modal("show")

    .appendTo(document.body)

$.rails.allowAction = (element) ->
  $(element).blur();
  message = element.data("confirm")
  answer = false
  return true unless message

  if $.rails.fire(element, "confirm")
    TwitterBootstrapConfirmBox message, element, ->
      if $.rails.fire(element, "confirm:complete", [answer])
        allowAction = $.rails.allowAction

        $.rails.allowAction = ->
          true

        if element.get(0).click
          element.get(0).click()

        else if Event?
          evt = new Event("click", {
            bubbles: true,
            cancelable: true,
            view: window,
            detail: 0,
            screenX: 0,
            screenY: 0,
            clientX: 0,
            clientY: 0,
            ctrlKey: false,
            altKey: false,
            shiftKey: false,
            metaKey: false,
            button: 0,
            relatedTarget: document.body.parentNode
          })
          element.get(0).dispatchEvent(evt)

        else if $.isFunction(document.createEvent)
          evt = document.createEvent "MouseEvents"
          evt.initMouseEvent(
            "click",
            true,   # e.bubbles,
            true,   # e.cancelable,
            window, # e.view,
            0,      # e.detail,
            0,      # e.screenX,
            0,      # e.screenY,
            0,      # e.clientX,
            0,      # e.clientY,
            false,  # e.ctrlKey,
            false,  # e.altKey,
            false,  # e.shiftKey,
            false,  # e.metaKey,
            0,      # e.button,
            document.body.parentNode # e.relatedTarget
          )
          element.get(0).dispatchEvent(evt)

        $.rails.allowAction = allowAction

  false
