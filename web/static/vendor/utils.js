/*
  This is in vendor so it can be used old school JS stylee
  http://www.phoenixframework.org/docs/static-assets
*/

var bc = [ 0x03152, 0x33455, 0x53657, 0xA3859, 0xC3A5B,
  0xF3D5E, 0x144162, 0x174463, 0x1B4666, 0x1F4B68, 0x254E6C, 0x29526E,
  0x2E5670, 0x325A74, 0x385D78, 0x3D627C, 0x42667E, 0x476B83, 0x4D6F88,
  0x54748B, 0x59798E, 0x5F7E93, 0x648397, 0x6A869B, 0x718C9F, 0x7691A4,
  0x7C96A7, 0x839AAA, 0x889FAF, 0x8EA4B2, 0x95A8B6, 0x9AADBB, 0xA1B3BF,
  0xA5B7C3, 0xABBCC6, 0xB2C0CB, 0xB7C5CE, 0xBCC9D2, 0xC1CED6, 0xC8D3D9,
  0xCDD6DD, 0xD2DBE2, 0xD5DEE3, 0xDAE1E7, 0xE0E5E9, 0xE4E9EC, 0xE8ECEF,
  0xECF0F3, 0xF1F2F6, 0xF2F6F7, 0xF7F8FA, 0xFAFBFD, 0xFCFEFD ];

function parseColor(color) {
	if (typeof color === 'number') {
		//make sure our hexadecimal number is padded out
		color = '#' + ('00000' + (color | 0).toString(16)).substr(-6);
	}

	return color;
};

function getQueryParameter ( parameterName ) {
  var queryString = window.top.location.search.substring(1);
  var parameterName = parameterName + "=";
  if ( queryString.length > 0 ) {
    var begin = queryString.indexOf ( parameterName );
    if ( begin != -1 ) {
      begin += parameterName.length;
      var end = queryString.indexOf ( "&" , begin );
        if ( end == -1 ) {
        end = queryString.length
      }
      return unescape ( queryString.substring ( begin, end ) );
    }
  }
  return "null";
}

$(document).ready(function() {
  var colour;
  var index = 1;
  bc.forEach(function(bcColour) {
    colour = parseColor(bcColour);
    $(".debug .blueness-swatch").append("<li style='background-color:"+colour+"'>"+index+": "+colour+"</li>");
    index++;
  });

  // hide things we animate into view
  $('#thumbnails-wrapper').css("visibility", "hidden");
  $('#menu').css("visibility", "hidden");

  // having trouble ovrriding if is this is done in CSS
  $('.menu-trigger').attr('fill', 'white');
  $('.sector').attr('fill', 'white');

  TweenMax.staggerFrom(".debug.colour li", 1,
                      {
                        scale:0.5, opacity:0, delay:0.1,
                        ease:Elastic.easeOut, force3D:true},
                      0.05);

});
