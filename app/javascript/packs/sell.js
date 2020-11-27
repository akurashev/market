$(() => {
  $('.js-sell-link').on('ajax:success', function() {
    update($(this), (a, b) => a + b)
  })

  $('.js-undo-link').on('ajax:success', function() {
    update($(this), (a, b) => a - b)
  })

  function update(initiator, operation) {
    let row = initiator.closest('tr')
    let price_cell = row.find('.js-price-cell');
    let qty_cell = row.find('.js-qty-cell');
    let sold_cell = row.find('.js-sold-cell');
    let total_sold_items = $('.js-total-sold-items')
    let total_sold = $('.js-total-sold')

    sold_cell.text(operation(parseInt(sold_cell.text()), 1))
    total_sold_items.text(operation(parseInt(total_sold_items.text()), 1))
    total_sold.text(operation(parseInt(total_sold.text()), parseInt(price_cell.text())))
  }
})
