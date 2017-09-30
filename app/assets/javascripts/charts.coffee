$(document).ready ->
  form = $('form')
  currency = $("#currency")
  quantity = $("#quantity")
  currency_destination = $("#currency_destination")
  generate_chart = ->
    $.ajax '/quota_period',
        type: 'POST'
        dataType: 'json'
        data: {
                currency: currency.val(),
                currency_destination: currency_destination.val(),
              }
        error: (jqXHR, textStatus, errorThrown) ->
          alert textStatus
        success: (data, text, jqXHR) ->
          console.log(data.date[0])
          c3.generate({
            bindTo: '#chart',
            data: {
                x: 'x',
                columns: [
                    ['x', data,data.date[0], data.date[2], data.date[3], data.date[4], data.date[5], data.date[6]],
                    ['Cotação', data.value[0], data.value[1], data.value[2], data.value[3], data.value[4], data.value[5], data.value[6]]
                ]
            },
            axis: {
                x: {
                    type: 'timeseries',
                    tick: {
                        format: '%d-%m-%Y'
                    }
                }
            }
         });

  generate_chart()
  $("#exchange_icon").click ->
    generate_chart()

  currency.change ->
    generate_chart()

  currency_destination.change ->
    generate_chart()
