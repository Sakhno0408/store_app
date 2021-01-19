$('#orders').on 'click', '.del-order', ->
  id = $(this).data('id')
  if confirm('Вы действительно хотите удалить заказ?')
    $.ajax
      beforeSend: (xhr) ->
        xhr.setRequestHeader 'X-CSRF-Token', $('meta[name="csrf-token"]').attr('content')
        return
      url: '/orders/' + id
      data: id: id
      method: 'delete'
      type: 'POST'
      success: (res) ->
        str_class = '.tr-item-' + id
        $(str_class).remove()
        return
      error: ->
        alert 'Error! Destroy oredr ID=' + id
        return
  return
