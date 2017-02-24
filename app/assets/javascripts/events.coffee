# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
`
$(function Google_Map_Link(){ 
      
      var $editItem = $(".address");
      var $link = $editItem.val();
      
      var $maplink = $("a.map-link");
    
      var $pluslink = $link.replace(/\s+/g, '+');
      
      $maplink.show();
    
      $maplink.attr("href", 'https://maps.google.co.uk/maps?q=' + $pluslink);
    
      // remove - this is just for showing the href being output
      $(".address").text($pluslink);
 });
 `