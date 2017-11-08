<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Distance Matrix service</title>
<style>
#right-panel {
	font-family: 'Roboto', 'sans-serif';
	line-height: 30px;
	padding-left: 10px;
}

#right-panel select, #right-panel input {
	font-size: 15px;
}

#right-panel select {
	width: 100%;
}

#right-panel i {
	font-size: 12px;
}

html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}

#map {
	height: 100%;
	width: 50%;
}

#right-panel {
	float: right;
	width: 48%;
	padding-left: 2%;
}

#output {
	font-size: 11px;
}
</style>
</head>
<body>
	<div id="right-panel">
		<div id="inputs">
var origin1 = <p id="clickLocation"></p>
var destination = {lat: 37.498993, lng: 127.032910};
		</div>
		<div>
			<strong>Results</strong>
		</div>
		<div id="output"></div>
	</div>
	<div id="map"></div>
	<script>
		var map;
		var marker;
		var beforeMarker;
		var origin=null;
		var destination = {
				lat : 37.498993,
				lng : 127.032910
			};
		var destinationIcon = 'https://chart.googleapis.com/chart?'
				+ 'chst=d_map_pin_letter&chld=D|FF0000|000000';
		var originIcon = 'https://chart.googleapis.com/chart?'
				+ 'chst=d_map_pin_letter&chld=O|FFFF00|000000';
		var Distance;
		function initMap() {
			var bounds = new google.maps.LatLngBounds;
			var markersArray = [];

			map = new google.maps.Map(document.getElementById('map'), {
				center : {
					lat : 37.498993,
					lng : 127.032910
				},
				zoom : 18
			});
			
			desMarker = new google.maps.Marker({
				position : destination,
				map : map,
				icon : destinationIcon
			});
			
			google.maps.event.addListener(map, 'click', function(event) {
				document.getElementById("clickLocation").innerHTML=event.latLng;
				placeMarker(event.latLng);
				origin = event.latLng;
				calculateDistance(origin,destination);
			});
		}
			
		function placeMarker(location) {
			marker = new google.maps.Marker({
				position : location,
				map : map,
				icon : originIcon
			});
			marker.setMap(map);

			if (beforeMarker != null) {
				beforeMarker.setMap(null);
			}

			beforeMarker = marker;
		}

		function calculateDistance(origin, destination){
			var geocoder = new google.maps.Geocoder;
			var service = new google.maps.DistanceMatrixService;
			service.getDistanceMatrix(
							{
								origins : [ origin ],
								destinations : [ destination ],
								travelMode : 'WALKING',
								unitSystem : google.maps.UnitSystem.METRIC,
								avoidHighways : false,
								avoidTolls : false
							}, callback);
							
		}
		
		function callback(response, status) {
			  if (status == 'OK') {
			    var origins = response.originAddresses;
			    var destinations = response.destinationAddresses;

			    for (var i = 0; i < origins.length; i++) {
			      var results = response.rows[i].elements;
			      for (var j = 0; j < results.length; j++) {
			        var element = results[j];
			        var distance = element.distance.text;
			        var duration = element.duration.text;
			        var from = origins[i];
			        var to = destinations[j];
			        Distance = distance;
			        document.getElementById("output").innerHTML=Distance;
			      }
			    }
			  }
			}
		
		function deleteMarkers(markersArray) {
			
			for (var i = 0; i < markersArray.length; i++) {
				markersArray[i].setMap(null);
			}
			markersArray = [];
		}
	</script>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD0fKjIPcjpOxeJ5WV8HaMxt04YNlZX3XA&callback=initMap">
		
	</script>
</body>
</html>