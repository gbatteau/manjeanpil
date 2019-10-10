# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $('#place_latitude').hide()
  $('#place_longitude').hide()
  markersArray = []
  lat_field = parseFloat $('#place_latitude')[0].innerText
  lng_field = parseFloat $('#place_longitude')[0].innerText

  window.initMap = ->
    if $('#map').size() > 0
      locationObject = {lat: lat_field, lng: lng_field}
      map = new google.maps.Map document.getElementById('map'), {
        center: locationObject
        zoom: 15
      }

      marker = new google.maps.Marker({
        position: locationObject,
        map: map,
      })

      markersArray.push marker
