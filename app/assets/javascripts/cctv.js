var markers = [];
function initialize_cctv_map() {
  if(document.contains(document.getElementById("cctv_map_canvas"))) {
    var mapOptions = {
      center: new google.maps.LatLng(40.67, -73.940),
      zoom: 7
    };
 
    var map = new google.maps.Map(document.getElementById("cctv_map_canvas"),
          mapOptions);

    var cctvs = $('#cctv_map_canvas').data('cctvs');
    for(var i = 0; i < cctvs.length; i++) {
      var marker = new google.maps.Marker({
        position: new google.maps.LatLng(cctvs[i]['latitude'], cctvs[i]['longitude']),
        map: map,
        title: cctvs[i]['name']
      });

      google.maps.event.addListener(marker, 
         	'mouseover',
		function() {
		  marker = this;
		  marker['infowindow'] = new google.maps.InfoWindow();
		  marker['infowindow'].open(map, marker);
		  ajax_url = '/cctv/' + marker.title;
		  $.getJSON(ajax_url, null, function(json) {
		    marker['infowindow'].setContent("<div><img src=" + json.cctv_url + "></img></div>");
		  });
		});

      google.maps.event.addListener(marker,
	        'mouseout',
	         function() {
		   this['infowindow'].close(map, marker);
		 });
    }
  }
}
google.maps.event.addDomListener(window, 'load', initialize_cctv_map);

function filterMarkersBy(eventType) {
  
};
