check_submit_btn =(qty_all) ->
  if qty_all == 0
    $('#order .btn-crt-order').attr('disabled', 'disabled')


$('#order').on 'click', '.plus-quantity', ->
  id = $(this).data('id')

  str_class = '.qty-' + id
  qty = Number($(str_class).text()) + 1
  $(str_class).text qty

  str_class = '.price-' + id
  price = Number($(str_class).text())

  str_class = '.qty-input-' + id
  $(str_class).val qty

  qty_all = Number($('.cart-qty').text()) + 1
  $('.cart-qty').text qty_all

  cart_sum = Number($('.cart-sum').text()) + price
  $('.cart-sum').text cart_sum.toFixed(2)

$('#order').on 'click', '.minus-quantity', ->
  id = $(this).data('id')
  str_class = '.qty-' + id
  qty = Number($(str_class).text())
  if qty>1
    qty--
    $(str_class).text qty
    str_class = '.qty-input-' + id
    $(str_class).val qty

    qty_all = Number($('.cart-qty').text()) - 1
    $('.cart-qty').text qty_all

    str_class = '.price-' + id
    price = Number($(str_class).text())

    cart_sum = Number($('.cart-sum').text()) - price
    $('.cart-sum').text cart_sum.toFixed(2)

$('#order').on 'click', '.del-item', ->
  id = $(this).data('id')

  str_class = '.qty-' + id
  qty = Number($(str_class).text())

  str_class = '.price-' + id
  price = Number($(str_class).text())

  str_class = '.tr-item-' + id
  $(str_class).remove()

  qty_all = Number($('.cart-qty').text()) - qty
  $('.cart-qty').text qty_all
  check_submit_btn qty_all

  cart_sum = Number($('.cart-sum').text()) - price*qty
  $('.cart-sum').text cart_sum.toFixed(2)
