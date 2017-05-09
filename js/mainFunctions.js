$(document).ready(function(){
// Add initial mapbox map
// mapbox access token
// pk.eyJ1Ijoia3Jpc3RlbnpoYW8iLCJhIjoiY2owYmRwMW8wMDNkNjMycXZpNXRleGh5ZyJ9.ehSSEnz9iyMwUcZO6I8Etw
  var map = L.map('map', {
    center: [43.068874, -89.402436],
    zoom: 14
  });
  var Stamen_TonerLite = L.tileLayer('http://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}.png', {
    attribution: 'Map tiles by <a href="http://stamen.com">Stamen Design</a>, <a href="http://creativecommons.org/licenses/by/3.0">CC BY 3.0</a> &mdash; Map data &copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>',
    subdomains: 'abcd',
    minZoom: 0,
    maxZoom: 20,
    ext: 'png'
  }).addTo(map);

  // get bike count data for capital city trail
  var sql = 'SELECT * FROM capital_hourly_latlon';
  var cartoURL = "https://KristenZhao.carto.com/api/v2/sql?format=GeoJSON&q="+sql;
  $.getJSON(cartoURL).done(function(data){
    console.log(data);
    console.log(typeof(data.features[0].properties.hour));
    var time = moment(data.features[0].properties.hour).add(5,'hour');
    console.log('time',time);
  });


   $("#hour-of-day").multiselect({
     close: function(event,ui){
       var selected = $('#hour-of-day').val();
       console.log('selected',selected);
     }
   });

   $("#day-of-week").multiselect({
     close: function(event,ui){
       var selected = $('#day-of-week').val();
       console.log('selected',selected);
     }
   });

   $("#month-of-year").multiselect({
     close: function(event,ui){
       var selected = $('#month-of-year').val();
       console.log('selected',selected);
     }
   });

// try the torque map
var CARTOCSS = [
  'Map {',
    '-torque-frame-count: 256;',
    '-torque-animation-duration: 30;',
    '-torque-time-attribute: "hour";',
    '-torque-aggregation-function: "count(1)";',
    '-torque-resolution: 4;',
    '-torque-data-aggregation: linear;',
  '}',
  '#layer {',
    'marker-width: 7;',
    'marker-fill: #FFB927;',
    'marker-fill-opacity: 0.9;',
    'marker-line-width: 1;',
    'marker-line-color: #FFF;',
    'marker-line-opacity: 1;',
    'comp-op: source-over;',
      '}'
    ].join('\n');

  // console.log('torquelayer',L.TorqueLayer());
  var torqueLayer = new L.TorqueLayer({
    user : 'kristenzhao',
    api: '5ed55fe18cc029d2d915917eb74427f5be845638',
    table : 'capital_hourly_latlon',
    // sql_query : 'SELECT * FROM capital_hourly_latlon WHERE whatever',
    cartocss: CARTOCSS
  });

  torqueLayer.error(function(err){
    for(var error in err){
      console.warn(err[error]);
    }
  });
  torqueLayer.addTo(map);
  torqueLayer.play();
});
