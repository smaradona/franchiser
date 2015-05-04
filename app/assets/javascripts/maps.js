$(document).ready(function () {

$( "#papas" ).click(function() {
  $('#franchise_latitude').val("66.6666");
});

function initialize() {

  var greyIcon = {
    url: "https://cdn2.iconfinder.com/data/icons/windows-8-metro-style/128/marker.png",
    size: new google.maps.Size(71, 71),
    origin: new google.maps.Point(0, 0),
    anchor: new google.maps.Point(17, 34),
    scaledSize: new google.maps.Size(25, 25)
  };

  var colorIcon = {
    url: "https://cdn1.iconfinder.com/data/icons/Map-Markers-Icons-Demo-PNG/256/Map-Marker-Marker-Outside-Pink.png",
    size: new google.maps.Size(71, 71),
    origin: new google.maps.Point(0, 0),
    anchor: new google.maps.Point(17, 34),
    scaledSize: new google.maps.Size(25, 25)
  };
  var markers = [];
  if (typeof latitudes !== 'undefined' && latitudes.length > 0) {
    setTimeout(function () {
      var map = new google.maps.Map(document.getElementById('map-canvas'), {
        zoom: 6,
        center: new google.maps.LatLng(-30.5504369, -62.5015085),
        mapTypeId: google.maps.MapTypeId.ROADMAP
      });
      for (var i = 0; i < latitudes.length; i++) {
        localization = new google.maps.LatLng(latitudes[i], longitudes[i]);
        var marker = new google.maps.Marker({
          position: localization,
          map: map,
          icon: colorIcon,
        });
        markers.push(marker);
        var circle = new google.maps.Circle({
          map: map,
          radius: 2000,
          fillColor: '#AA0000'
        });
        circle.bindTo('center', marker, 'position');
      }
    }, 1000);
  }
  if (typeof franchLat !== 'undefined') {
    setTimeout(function () {
      var map = new google.maps.Map(document.getElementById('map-canvas'), {
        zoom: 18,
        center: new google.maps.LatLng(franchLat, franchLng),
        mapTypeId: google.maps.MapTypeId.ROADMAP
      });
      localization = new google.maps.LatLng(franchLat, franchLng);
      var marker = new google.maps.Marker({
        position: localization,
        map: map,
        draggable: true,
        icon: colorIcon,
      });
      markers.push(marker);
      google.maps.event.addListener(marker, 'dragend', function(evt){
          latitude = evt.latLng.lat();
          longitude = evt.latLng.lng();
          $('#latitude').val(latitude);
          $('#longitude').val(longitude);
      });
    }, 500);
  } else {
    var map = new google.maps.Map(document.getElementById('map-canvas'), {
      zoom: 6,
      center: new google.maps.LatLng(-30.5504369, -62.5015085),
      mapTypeId: google.maps.MapTypeId.ROADMAP
    });  
  }


  function clearMarkers() {
  	for (var i = 0, marker; marker = markers[i]; i++) {
      marker.setMap(null);
    }
    markers = [];
  }

  function addFranchise(location) {
    alert(location);
	  clearMarkers();
	  var marker = new google.maps.Marker({
	    position: location,
	    map: map,
	    icon: colorIcon,
	    draggable: true,
	    animation: google.maps.Animation.DROP
	  });
	  markers.push(marker);
    latitude = markers[0].getPosition().lat();
    longitude = markers[0].getPosition().lng();
    $('#latitude').val(latitude);
    $('#longitude').val(longitude);
	}

  // Create the search box and link it to the UI element.
  var input = /** @type {HTMLInputElement} */(
      document.getElementById('pac-input'));
  map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

  var searchBox = new google.maps.places.SearchBox(
    /** @type {HTMLInputElement} */(input));

  // This event listener will call addMarker() when the map is clicked.
  google.maps.event.addListener(map, 'click', function(event) {
    addFranchise(event.latLng);
  });
  // Listen for the event fired when the user selects an item from the
  // pick list. Retrieve the matching places for that item.
  google.maps.event.addListener(searchBox, 'places_changed', function() {
    var places = searchBox.getPlaces();

    if (places.length == 0) {
      return;
    }
    clearMarkers();

    // For each place, get the icon, place name, and location.
    markers = [];
    var franchise;
    var bounds = new google.maps.LatLngBounds();
    for (var i = 0, place; place = places[i]; i++) {

      // Create a marker for each place.
      var marker = new google.maps.Marker({
        map: map,
        icon: greyIcon,
        position: place.geometry.location,
        draggable: true
      });
			markers.push(marker);

			google.maps.event.addListener(marker, 'click', function() {
				locations = this.position;
				clearMarkers();

			  var marker = new google.maps.Marker({
			    position: locations,
			    map: map,
			    icon: colorIcon,
			    draggable: true,
			    animation: google.maps.Animation.DROP
			  });
			  markers.push(marker);
        latitude = markers[0].getPosition().lat();
        longitude = markers[0].getPosition().lng();
        $('#latitude').val(latitude);
        $('#longitude').val(longitude);
    	});

      //var lat = marker.getPosition().lat();
			//var lng = marker.getPosition().lng();

      bounds.extend(place.geometry.location);
    }

    map.fitBounds(bounds);
  });

  // Bias the SearchBox results towards places that are within the bounds of the
  // current map's viewport.
  google.maps.event.addListener(map, 'bounds_changed', function() {
    var bounds = map.getBounds();
    searchBox.setBounds(bounds);
  });
}
google.maps.event.addDomListener(window, 'load', initialize);
});