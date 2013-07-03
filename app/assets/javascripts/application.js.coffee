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
	if(typeof($("#startup_description").val()) == "undefined")
		left = 500
		$("#char-count").html left
	else
		left = 500 - $("#startup_description").val().length
		$("#char-count").html left

handleResizing = () ->
	center = window.map.getCenter()
	google.maps.event.trigger(window.map, "resize")
	window.map.setCenter(center)

window.loadStartups = () ->
	$.ajax
		url: "/startups",
		dataType: 'json',
		type: 'GET',
		success: (data, status, xhr) ->
			$(data).each () ->
				startup = this
				lat_lng = new google.maps.LatLng(startup.lng, startup.lat)
				marker = new google.maps.Marker
					position: lat_lng
					map: window.map
					title: startup.name

$(document).ready ->
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

	updateCountdown()
	$("#startup_description").change(updateCountdown)
	$("#startup_description").keyup(updateCountdown)

