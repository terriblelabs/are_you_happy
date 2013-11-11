class RandomQuote
  constructor: ->

  get: (callback) =>
    url = "/quote.json"
    $.getJSON url, (data) ->
      callback(data)

class FormHandler
  constructor: (@options) ->
    $('form').on 'ajax:success', @saved

    $('body, #thanks').on 'click', @showInput

    @nextQuote()

  nextQuote: =>
    (new RandomQuote).get (quote) =>
      @quote = quote

    @quote

  showInput: (e) =>
    $('#input').show()
    $('#thanks').hide()

  saved: =>
    $('#thanks #quote').html(@nextQuote())
    $('#input').hide()
    $('#thanks').show()
    setTimeout @showInput, 15000


@FormHandler = FormHandler
