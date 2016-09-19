$(document).on "change", "select#reservation_room_id", ->
  $.ajax
    url: "/reservations/get_room"
    dataType: "json"
    data: {id:$(this).val()}
    error: (jqXHR, textStatus, errorThrown) ->
      $('body').append "AJAX Error: #{errorThrown}"
    success: (data, textStatus, jqXHR) ->
      $('#reservation_changed_count_of_person').val(data.count_of_person)
