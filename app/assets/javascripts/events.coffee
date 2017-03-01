# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(window).load ->
  $elements = document.getElementsByClassName('address')
  i = 0
  while i < $elements.length
    $editItem = $elements[i]
    $link = $editItem.text
    $pluslink = $link.replace(/\s+/g, '+')
    #document.getElementById('address').href = 'https://www.google.com/maps?q=' + $pluslink
    $elements[i].href='https://www.google.com/maps?q=' + $pluslink
    # $('#address').text 'Google Maps Link'
    $elements[i].text='Google Maps Link'
    i++
  
  return
  
# Google_Map_link ->
#   $editItem = $('.address')
#   $link = $editItem.val()
#   $maplink = $('a.map-link')
#   $pluslink = $link.replace(/\s+/g, '+')
#   $maplink.show()
#   $maplink.attr 'href', 'https://maps.google.co.uk/maps?q=' + $pluslink
#   # remove - this is just for showing the href being output
#   $('.address').text $pluslink
#   return


#`
# $(function Google_Map_Link(){ 
      
#       var $editItem = $(".address");
#       var $link = $editItem.val();
      
#       var $maplink = $("a.map-link");
    
#       var $pluslink = $link.replace(/\s+/g, '+');
      
#       $maplink.show();
    
#       $maplink.attr("href", 'https://maps.google.co.uk/maps?q=' + $pluslink);
    
#       // remove - this is just for showing the href being output
#       $(".address").text($pluslink);
#  });
#  `