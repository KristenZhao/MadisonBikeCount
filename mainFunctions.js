// Add initial mapbox map
// mapbox access token
// pk.eyJ1Ijoia3Jpc3RlbnpoYW8iLCJhIjoiY2owYmRwMW8wMDNkNjMycXZpNXRleGh5ZyJ9.ehSSEnz9iyMwUcZO6I8Etw
// var map = L.map('map', {
//   center: [43.068874, -89.402436],
//   zoom: 14
// });
// var Stamen_TonerLite = L.tileLayer('http://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}.png', {
//   attribution: 'Map tiles by <a href="http://stamen.com">Stamen Design</a>, <a href="http://creativecommons.org/licenses/by/3.0">CC BY 3.0</a> &mdash; Map data &copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>',
//   subdomains: 'abcd',
//   minZoom: 0,
//   maxZoom: 20,
//   ext: 'png'
// }).addTo(map);

L.mapbox.accessToken = 'pk.eyJ1Ijoia3Jpc3RlbnpoYW8iLCJhIjoiY2owYmRwMW8wMDNkNjMycXZpNXRleGh5ZyJ9.ehSSEnz9iyMwUcZO6I8Etw';
// Create a map in the div #map
var map = L.mapbox.map('map').setView([43.068874, -89.402436], 14);
//, 'mapbox.satellite'
var map = L.mapbox.styleLayer('mapbox://styles/kristenzhao/cj2got6vu005d2sryjthydw4a').addTo(map);

// get bike count data for capital city trail
var sql = 'SELECT * FROM capital_hourly_latlon';
var cartoURL = "https://KristenZhao.carto.com/api/v2/sql?format=GeoJSON&q="+sql;
$.getJSON(cartoURL).done(function(data){
  console.log(data);
});
