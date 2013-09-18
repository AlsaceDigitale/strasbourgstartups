# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require bootstrap
#= require_tree .

updateCountdown = () ->
  node = $(this)
  count_node = node.next().find(".char-count")
  if(typeof(node.val()) == "undefined")
    left = 500
    count_node.html left
  else
    left = 500 - node.val().length
    count_node.html left

handleResizing = () ->
	center = window.map.getCenter()
	google.maps.event.trigger(window.map, "resize")
	window.map.setCenter(center)

window.loadStartups = () ->
	window.infos = []
	$.ajax
		url: "/startups",
		dataType: 'json',
		type: 'GET',
		success: (data, status, xhr) ->
			$(data).each () ->
				location = this
				lat_lng = new google.maps.LatLng(location.lat, location.lng)
				contents = for startup in location.startups
					content = $(".startup-info.template").clone().removeClass("template")
					for attr, value of startup
						content.find(".#{attr}").html(value)
					$("<div>").html(content).html()
				marker = new google.maps.Marker
					position: lat_lng
					map: window.map
					title: location.startups[0][2]
				infoWindow = new google.maps.InfoWindow
					position: lat_lng
					content: contents.join("")
					maxWidth: 400
				infos.push(infoWindow)
				google.maps.event.addListener marker, "click", () ->
					item.close() for item in infos
					map.setCenter(lat_lng)
					infoWindow.open(map, marker)

initialize = () ->
	if $("#map").length > 0
	  map = new google.maps.Map(document.getElementById("map"),
	    mapTypeId: google.maps.MapTypeId.ROADMAP
	    zoom: 14
	  )

	  center = new google.maps.LatLng(48.583148, 7.747882000000004)
	  map.setCenter center

		google.maps.event.addDomListener window, "resize", () ->
			handleResizing()
		window.map = map

		window.loadStartups()

		$(".open_infoWindow").on "click", (e) ->
			item.close() for item in window.infos
			lat_lng = new google.maps.LatLng($(this).data("lat"), $(this).data("lng"))
			content = $(".startup-info.template").clone().removeClass("template")
			for attr, value of $(this).data()
				content.find(".#{attr}").html(value)
			content = $("<div>").html(content).html()
			console.log content
			infoWindow = new google.maps.InfoWindow
				position: lat_lng
				content: content
				maxWidth: 400
			map.setCenter(lat_lng)
			infoWindow.open(map)
			console.log infos
			infos.push(infoWindow)
			false

  $("#startup_description_fr").change(updateCountdown)
  $("#startup_description_fr").keyup(updateCountdown)
  $("#startup_description_en").change(updateCountdown)
  $("#startup_description_en").keyup(updateCountdown)

  $("#startup_description_fr").trigger("change")
  $("#startup_description_en").trigger("change")

$(initialize)
$(document).on "page:load", initialize
