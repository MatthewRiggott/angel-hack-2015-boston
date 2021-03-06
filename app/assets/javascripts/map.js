//= require jquery
//= require jquery_ujs
//= require foundation

var coordsArray = [];
var alerted = false;

function closeAlert(event){
  if (alerted === false) {
  alert(event + ' is within walking distance')
  alerted = true;
  }
};
function close(position, coordsArray, data){
  var currentLat = position.coords.latitude;
  var currentLong = position.coords.longitude;
  for (i=0; i<coordsArray.length; i++) {
    var latDistance = Math.abs(currentLat -  coordsArray[i][0])
    var longDistance = Math.abs(currentLong - coordsArray[i][1])
    if ( latDistance + longDistance < .02 ) {
      closeAlert(data[i].title);
    };
  }
};
$(function(){ $(document).foundation();
  $.get( '/user_recommendations.json', function( data ) {
    var map = L.map('map').setView([42.351776, -71.061371], 14);
    accessToken = 'pk.eyJ1IjoidmlydHVhbC1tb25rIiwiYSI6Ijc2MkxoLVUifQ.0QGDsafsrp25jF3eN6eUeQ';
    L.tileLayer('https://api.tiles.mapbox.com/v4/virtual-monk.ln2km151/{z}/{x}/{y}.png?access_token=' + accessToken, {
        attribution: '<a href="http://www.mapbox.com/about/maps/" target="_blank">Terms &amp; Feedback</a>'
    }).addTo(map);
    var coordsArray = [];
    for (i=0; i<data.length; i++) {
      var coordinatesArray =  [data[i].latitude, data[i].longitude];
      coordsArray.push(coordinatesArray);
      var marker = L.marker([coordinatesArray[0],coordinatesArray[1]]);
      marker.addTo(map);
      var popup = '<div >'
      popup += '<h1><a id="modalTitle" href="/recommendations/' + data[i].id + '">' + data[i].title + '</a></h1>'
      popup += '</div>'
      marker.bindPopup(popup);
    }
    if (coordsArray.length > 0) {
        var bounds = new L.LatLngBounds(coordsArray);
        console.log(coordsArray);
        console.log(bounds);
        map.fitBounds(bounds);
      }
    var x = navigator.geolocation.getCurrentPosition(showPosition);
    function showPosition(position) {
    setInterval(function(){ close(position,coordsArray,data); }, 3000);
  }
  });



});

