/*
  This is in vendor so it can be used old school JS stylee
  http://www.phoenixframework.org/docs/static-assets
*/

var bc = [ "#f4fbfe", "#f4fbfe", "#ecf8fd", "#e5f5fd", "#def2fc", "#d6effc",
           "#cfebfa", "#c7e4f7", "#c0dff3", "#b9d9ed", "#b3d4e8", "#accfe4",
           "#a5cbdf", "#9ec6db", "#98c1d7", "#91bdd2", "#86b7cf", "#7db2cb",
           "#77adc8", "#6ea8c7", "#62a3c3", "#5a9dbe", "#5298bc", "#4693ba",
           "#3a8eb6", "#378bb3", "#3485ad", "#2d80a9", "#287da5", "#2677a1",
           "#24739c", "#1e6d96", "#1c6991", "#10648e", "#0c5f89", "#055b86",
           "#005682", "#00537b", "#004e74", "#064b6e", "#094767", "#0e4361",
           "#113d57", "#133951", "#14354a", "#173244", "#182f40", "#192c3b",
           "#192937", "#182532", "#18222d", "#161e28", "#101822" ];

function parseColor(color) {
	if (typeof color === 'number') {
		//make sure our hexadecimal number is padded out
		color = '#' + ('00000' + (color | 0).toString(16)).substr(-6);
	}

	return color;
};

var is_chrome = navigator.userAgent.indexOf('Chrome') > -1;
var is_explorer = navigator.userAgent.indexOf('MSIE') > -1;
var is_firefox = navigator.userAgent.indexOf('Firefox') > -1;
var is_safari = navigator.userAgent.indexOf("Safari") > -1;
var is_opera = navigator.userAgent.toLowerCase().indexOf("op") > -1;
if ((is_chrome)&&(is_safari)) {is_safari=false;}
if ((is_chrome)&&(is_opera)) {is_chrome=false;}

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

window.mobilecheck = function() {
  var check = false;
  (function(a){if(/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows ce|xda|xiino/i.test(a)||/1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(a.substr(0,4)))check = true})(navigator.userAgent||navigator.vendor||window.opera);
  return check;
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

  if (is_safari) {
    if (window.mobilecheck() == true) {
      $('.cyan-display-main').css('padding-top', '30px');
    } else {
      $('.cyan-display-main').css('padding-top', '0px');
    }
  }

  TweenMax.staggerFrom(".debug.colour li", 1,
                      {
                        scale:0.5, opacity:0, delay:0.1,
                        ease:Elastic.easeOut, force3D:true},
                      0.05);

});
