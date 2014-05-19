$("select#entry_birth_year").change ->
  $.ajax
    url: "/change_day_select"
    type: "GET"
    data:
      year: $("#entry_birth_year option:selected").val()
      month: $("#day_select option:selected").val()
      day: $("#change_day option:selected").val()
    dataType: "script"
    success: (data) ->
      return data
    error: (data) ->
      alert "errror"
      return

  return
$("select#day_select").change ->
  $.ajax
    url: "/change_day_select"
    type: "GET"
    data:
      year: $("#entry_birth_year option:selected").val()
      month: $("#day_select option:selected").val()
      day: $("#change_day option:selected").val()
    dataType: "script"
    success: (data) ->
      return data
    error: (data) ->
      alert "errror"
      return
  return