var isMousedOut = false;
var intervalId;
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
		  isMousedOut = false;
		  this['infowindow'] = new google.maps.InfoWindow();
		  setCCTVURL(this);   
		  if(!isMousedOut) { 
		    this['infowindow'].open(map, this);
		    marker = this;
		    intervalId = setInterval(function() {
		      setCCTVURL(marker);
		    }, 10000);
		  }
	        });

      google.maps.event.addListener(marker,
	        'mouseout',
	         function() {
		   isMousedOut = true;
		   this['infowindow'].close(map, marker);
		   clearInterval(intervalId);
		 });
    }
  }
}
google.maps.event.addDomListener(window, 'load', initialize_cctv_map);

function setCCTVURL(marker) {
 ajax_url = '/cctv/' + marker.title;
 $.getJSON(ajax_url, null, function(json) {
   setMarkerContent(marker, json.cctv_url);  
 });
}

function setMarkerContent(marker, imageURL) {
  marker['infowindow'].setContent("<div><img src=" + imageURL + "#" + new Date().getTime() + "></img></div>");
}
