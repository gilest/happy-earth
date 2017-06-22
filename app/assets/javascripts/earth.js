function initialize() {
  var locations = window.locations;
  var lastLocation = locations[locations.length - 1];
  var options = {
    atmosphere: false,
    center: lastLocation,
    zoom: 2.5
  };
  window.earth = new WE.map('earth_div', options);
  WE.tileLayer('http://tileserver.maptiler.com/nasa/{z}/{x}/{y}.jpg', {
    minZoom: 0,
    maxZoom: 5,
    attribution: 'NASA',
  }).addTo(earth);
  for (i = 0; i < locations.length; i++) {
    WE.marker(locations[i]).addTo(window.earth)
  }
}

$( document ).on('turbolinks:load', function() {
  initialize();
});
