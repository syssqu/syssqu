# 変数群

#初期設定(ページを読み込んだ時に実行する関数)
initialize = ->

  # 緯度・経度変数
  latlng = new google.maps.LatLng(34.688947, 135.506578)

  # 地図のオプション設定変数
  myOptions =

    # カメラの向き
    heading: -20

    # 初期のズーム レベル
    zoom: 16

    # 地図の中心点
    center: latlng

    # 地図タイプ
    mapTypeId: google.maps.MapTypeId.ROADMAP


  #地図オブジェクト生成
  map = new google.maps.Map(document.getElementById("map_canvas"), myOptions)

  #マーカー
  m_latlng = new google.maps.LatLng(34.689166, 135.506073)
  marker = new google.maps.Marker(
    position: m_latlng
    map: map
  )
  google.maps.event.addListener marker, "click", ->
    infowindow = new google.maps.InfoWindow(content: "<div style='width : 220px;height : 70px;'><b>株式会社システム・スクゥェアー</b><br/><br/>大阪市中央区伏見町2丁目1-1<br/>三井住友銀行高麗橋ビル7階</div>")
    infowindow.open map, marker
    return

  # ストリートビューオブジェクト生成
  s_view = new google.maps.StreetViewPanorama(document.getElementById("s_view"),
    position: map.getCenter()
  )

  # ストリートビューオブジェクト詳細設定
  s_view.setPov
    heading: 310
    pitch: 30
    zoom: 1


  # マップとストリートビューを一致させる為の記述
  map.setStreetView s_view
  return
map = undefined
s_view = undefined
# function initialize()
# ページを読み込んだ時にinitialize()を実行
google.maps.event.addDomListener window, 'load', initialize
#$(document).on('page:change', initialize)