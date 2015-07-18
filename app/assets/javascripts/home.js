// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


   google.load("visualization", "1", {packages:["geochart"]});
 
 $(function() {

   google.setOnLoadCallback(drawMap);

    function drawMap() {
         // when document loads, grab the json
         $.getJSON('data.json', function(data) {
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
                 map.setValue(i, 2, v.text);
             });

              var options = {};
              options['colors'] = [0xFF8747, 0xFFB581, 0xc06000]; //orange colors
              options['displayMode'] = 'markers';
              options['datalessRegionColor']='#f5f5f5';
              options['width'] = '1200px';
              options['height'] = '900px';
              options['showLegend'] = false;

             // finally, create the map!
             var geochart = new google.visualization.GeoChart(
               document.getElementById('content'));
                  geochart.draw(map, options);
    
 
         });
};
});



