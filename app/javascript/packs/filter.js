$(() => {
  $('#name-filter').on('keyup', function() {
    const searchTerm = $(this).val().toLowerCase()

    $('.js-name-cell').each(function() {
      const content = $(this).text().toLowerCase()

      if (!content.match(searchTerm)) {
        $(this).closest('tr').hide()
      } else {
        $(this).closest('tr').show()
      }
    })
  })

  $('.js-filter-reset').on('click', function() {
    $('#name-filter').val('')
    $('tr').show()
  })
})
