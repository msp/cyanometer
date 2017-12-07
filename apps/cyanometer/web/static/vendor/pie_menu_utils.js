var svg,
    items,
    trigger,
    label,
    open,
    angle;

$(document).ready(function() {
  open = true;
  angle = 30;

  svg = document.getElementById('menu');
  if (svg) {
    items = svg.querySelectorAll('.item');
    trigger = document.getElementById('trigger');
    label = trigger.querySelectorAll('#label')[0];
    //set up event handler
    trigger.addEventListener('click', toggleMenu, false);
    // svg.style.pointerEvents = "none";

  }
});

//toggle menu when trigger is clicked
function toggleMenu(event) {
   if (!event) var event = window.event;
    event.stopPropagation();
  open = !open;

  if (open) {
    var tl = new TimelineLite();
    tl.to(trigger, 0.6, {scale:1, transformOrigin: "50% 50%", ease: Expo.easeInOut }, 0)
    tl.to(items, 0.2, {scale:1, ease:Back.easeOut.config(4)}, 0.05);
    // MSP using this open/close animation skews the position of the first segment from 12 o'clock
    // for(var i=0; i<items.length; i++){
    //   tl.to(items[i], 0.7, {rotation:-i*angle + "deg", ease:Bounce.easeOut}, 0.35);
    // }
    label.innerHTML = "-";
    svg.style.pointerEvents = "auto";
  } else {
    closePieMenu();
  }

}

function closePieMenu() {
  open = false;
  var tl = new TimelineLite();
  // MSP using this open/close animation skews the position of the first segment from 12 o'clock
  // for(var i=0; i<items.length; i++){
  //   tl.to(items[i], 0.3, {rotation: 0, ease:Circ.easeOut}, 0.05);
  // }
  tl.to(items, .3, {scale:0, ease:Back.easeIn}, 0.3);
  tl.to(trigger, 0.6, {scale:0.5, transformOrigin: "50% 50%", ease: Expo.easeInOut }, 0)
  label.innerHTML = "+";
  svg.style.pointerEvents = "none";

}

// svg.onclick = function (e) {
//     e.stopPropagation();
// }
//close the nav when document is clicked
// document.onclick = function () {
//     open = false;
//     var tl = new TimelineLite();
//     for(var i=0; i<items.length; i++){
//       tl.to(items[i], 0.3, {rotation: 0, ease:Circ.easeOut}, 0.05);
//     }
//     tl.to(items, .3, {scale:0, ease:Back.easeIn}, 0.3);
//     label.innerHTML = "+";
//     svg.style.pointerEvents = "none";
// };
