class RandomQuote
  constructor: ->

  get: (callback) =>
    url = "/quote.json"
    $.getJSON url, (data) ->
      callback(data.quote)

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
    $('#thanks p').html(@nextQuote())
    $('#input').hide()
    $('#thanks').show()


@FormHandler = FormHandler