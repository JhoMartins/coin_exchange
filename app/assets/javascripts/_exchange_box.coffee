$(document).ready ->
  form = $('form')
  currency = $("#currency")
  quantity = $("#quantity")
  currency_destination = $("#currency_destination")

  $("#exchange_icon").click ->
    currency_value = currency.val()
    currency.val(currency_destination.val())
    currency_destination.val(currency_value)

  currency.change ->
    if quantity.val() != 0
      form.submit()

  currency_destination.change ->
    if quantity.val() != 0
      form.submit()

  quantity.keyup ->
    form.submit()

  form.submit ->
    if form.attr('action') == '/exchange'
      $.ajax '/exchange',
          type: 'POST'
          dataType: 'json'
          data: {
                  currency: currency.val(),
                  currency_destination: currency_destination.val(),
                  quantity: quantity.val()
                }
          error: (jqXHR, textStatus, errorThrown) ->
            alert textStatus
          success: (data, text, jqXHR) ->
            $('#result').val(data.value)
        return false;
