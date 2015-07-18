// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


   google.load("visualization", "1", {packages:["geochart"]});
 
 $(function() {

   google.setOnLoadCallback(drawMap);

    function drawMap() {
         // when document loads, grab the json
         $.getJSON('home/data', function(data) {
             // once grabbed, we run this callback
 
             // setup the new map and its variables
             var map = new google.visualization.DataTable();
                 map.addRows(data.length);  // length gives us the number of results in our returned data
          
         
          map.addColumn('number', 'LATITUDE', 'Latitude');
map.addColumn('number', 'LONGITUDE', 'Longitude');
map.addColumn({type: 'string', role: 'tooltip'})
// Won't use this column, but still must define it.

 
             // now we need to build the map data, loop over each result
             $.each(data, function(i,v) {
                 // set the values for both the name and the population
                 map.setValue(i, 0, v.lat);
                 map.setValue(i, 1, v.long);
                 map.setValue(i, 2, v.tweet);
             });

              var options = {
              	displayMode :"markers",
              	legend:"none",
              	sizeAxis: { minValue: 0, maxValue: 100 },
              	colorAxis: {minValue:1, maxValue:1,colors: ['#e74c3c','#8e44ad']},
              	datalessRegionColor: '#27ae60',
              	  backgroundColor: '#f1c40f',
              	  width:'1200px',
              	  height:'900px'

              };
             

             // finally, create the map!
             var geochart = new google.visualization.GeoChart(
               document.getElementById('content'));
                  geochart.draw(map, options);
    
 
         });
};

$("circle").attr("stroke", "#e74c3c ");
$("circle").attr("fill", "#e74c3c ");
});



