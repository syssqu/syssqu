document.getElementById('30day').style.display = "none"
document.getElementById('29day').style.display = "none"
document.getElementById('28day').style.display = "none"
$("select").change ->
  $.ajax
    url: "/change_day_select"
    type: "GET"
    data:
      year: $("#entry_birth_year option:selected").val()
      # month: $("#day_select").attr("value")
      # year1: $("#entry_birth_year").val()
      month: $("#day_select option:selected").val()
    dataType: "script"
    success: (data) ->
      # alert data['month1']
      # alert $("#day_select").val()
      return data
    error: (data) ->
      alert "errror"
      return

  return