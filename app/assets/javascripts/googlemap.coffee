# 変数群

#初期設定(ページを読み込んだ時に実行する関数)
initialize = ->
  
  # 緯度・経度変数
  latlng = new google.maps.LatLng(34.689059, 135.506004)
  
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
  map = new google.maps.Map(document.getElementById("map"), myOptions)
  
  # ストリートビューオブジェクト生成
  pano = new google.maps.StreetViewPanorama(document.getElementById("pano"),
    position: map.getCenter()
  )
  
  # ストリートビューオブジェクト詳細設定
  pano.setPov
    heading: 20
    pitch: 0
    zoom: 0.5

  
  # マップとストリートビューを一致させる為の記述
  map.setStreetView pano
  return
map = undefined
pano = undefined
# function initialize()
# ページを読み込んだ時にinitialize()を実行
google.maps.event.addDomListener window, "load", initialize