jQuery ->
  # $(document).on 'change', 'input[type=text]', ->
  $('input[type=text]').unbind('change').change ->
    console.log($(this).closest('form').attr('action'))
    $.ajax
      beforeSend: (xhr) ->
        xhr.setRequestHeader("Accept", "application/json")
      data: "_method=post&#{$(this).attr('name')}=#{encodeURIComponent($(this).val())}&csrf_param=#{encodeURIComponent($('meta[name=csrf-token]').attr('content'))}"
      dataType: "text"
      type: "post"
      url: "#{$(this).closest('form').attr('action')}"

      error: (data) ->
        alert("Erro!")

      success: (data) ->
        alert("Success!")