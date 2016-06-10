// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"

import React from "react"
import ReactDOM from "react-dom"

function logNode(node) {
  console.log(node);
}

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
    $(".debug .blueness").append("<li style='background-color:"+colour+"'>"+index+": "+colour+"</li>");
    index++;
  });

  // having trouble ovrriding if JS is this is done in CSS
  $('.menu-trigger').attr('fill', 'white');

});

class CyanPieMenu extends React.Component {
  constructor(props) {
      super(props);

      this.handleClick = this.handleClick.bind(this);
  }

  handleClick(foo, e) {
    e.preventDefault();
    this.props.onUserSelectSlice(
      foo
    );
  }

  render() {
    console.log('CyanPieMenu.render');

    var SVGSliceStyle = {
      color: "red"
    };

    var fillColour = [];
    var imageIndex = 0;

    if (this.props.images) {
      this.props.images.forEach(function(image){
        fillColour[imageIndex] = parseColor(bc[image.blueness_index])
        imageIndex++;
      });
    }

    return (
        <svg xmlns="http://www.w3.org/2000/svg" xmlnsXlink="http://www.w3.org/1999/xlink" viewBox="-2 -2 504 504" id="menu">
          <g id="itemsContainer">
              <a onClick={this.handleClick.bind(this, "item-1")} className="item" id="item-1" role="link" tabindex="0" xlinkHref="#" xlinkTitle=" " transform="matrix(1,0,0,1,0,0)" data-svg-origin="250 250" style={SVGSliceStyle}><path fill={fillColour[0]} stroke="#111" d="M375,250 l125,0 A250,250 0 0,0 466.5063509461097,125.00000000000001 l-108.25317547305485,62.499999999999986 A125,125 0 0,1 375,250" className="sector"></path><use xlinkHref="#icon-1" width="35" height="35" x="437.2762756347656" y="177.63037109375" transform="rotate(75 454.7762756347656 195.13037109375)"></use></a>
              <a onClick={this.handleClick.bind(this, "item-2")} className="item" id="item-2" role="link" tabindex="0" xlinkHref=" " xlinkTitle=" " transform="matrix(0.86602,-0.49999,0.49999,0.86602,-91.50635094610965,158.4936490538903)" data-svg-origin="250 250" style={SVGSliceStyle}><path fill={fillColour[1]} stroke="#111" d="M375,250 l125,0 A250,250 0 0,0 466.5063509461097,125.00000000000001 l-108.25317547305485,62.499999999999986 A125,125 0 0,1 375,250" className="sector"></path><use xlinkHref="#icon-2" width="35" height="35" x="437.2762756347656" y="177.63037109375" transform="rotate(75 454.7762756347656 195.13037109375)"></use></a>
              <a onClick={this.handleClick.bind(this, "item-3")} className="item" id="item-3" role="link" tabindex="0" xlinkHref=" " xlinkTitle=" " transform="matrix(0.5,-0.86602,0.86602,0.5,-91.5063509461097,341.5063509461096)" data-svg-origin="250 250" style={SVGSliceStyle}><path fill={fillColour[2]} stroke="#111" d="M375,250 l125,0 A250,250 0 0,0 466.5063509461097,125.00000000000001 l-108.25317547305485,62.499999999999986 A125,125 0 0,1 375,250" className="sector"></path><use xlinkHref="#icon-3" width="35" height="35" x="437.2762756347656" y="177.63037109375" transform="rotate(75 454.7762756347656 195.13037109375)"></use></a>
              <a onClick={this.handleClick.bind(this, "item-4")} className="item" id="item-4" role="link" tabindex="0" xlinkHref=" " xlinkTitle=" " transform="matrix(0,-1,1,0,0,500)" data-svg-origin="250 250" style={SVGSliceStyle}><path fill={fillColour[3]} stroke="#111" d="M375,250 l125,0 A250,250 0 0,0 466.5063509461097,125.00000000000001 l-108.25317547305485,62.499999999999986 A125,125 0 0,1 375,250" className="sector"></path><use xlinkHref="#icon-4" width="35" height="35" x="437.2762756347656" y="177.63037109375" transform="rotate(75 454.7762756347656 195.13037109375)"></use></a>
              <a onClick={this.handleClick.bind(this, "item-5")} className="item" id="item-5" role="link" tabindex="0" xlinkHref=" " xlinkTitle=" " transform="matrix(-0.49999,-0.86602,0.86602,-0.49999,158.49364905389024,591.5063509461097)" data-svg-origin="250 250" style={SVGSliceStyle}><path fill={fillColour[4]} stroke="#111" d="M375,250 l125,0 A250,250 0 0,0 466.5063509461097,125.00000000000001 l-108.25317547305485,62.499999999999986 A125,125 0 0,1 375,250" className="sector"></path><use xlinkHref="#icon-5" width="35" height="35" x="437.2762756347656" y="177.63037109375" transform="rotate(75 454.7762756347656 195.13037109375)"></use></a>
              <a onClick={this.handleClick.bind(this, "item-6")} className="item" id="item-6" role="link" tabindex="0" xlinkHref=" " xlinkTitle=" " transform="matrix(-0.86602,-0.49999,0.49999,-0.86602,341.5063509461097,591.5063509461097)" data-svg-origin="250 250" style={SVGSliceStyle}><path fill={fillColour[5]} stroke="#111" d="M375,250 l125,0 A250,250 0 0,0 466.5063509461097,125.00000000000001 l-108.25317547305485,62.499999999999986 A125,125 0 0,1 375,250" className="sector"></path><use xlinkHref="#icon-6" width="35" height="35" x="437.2762756347656" y="177.63037109375" transform="rotate(75 454.7762756347656 195.13037109375)"></use></a>
              <a onClick={this.handleClick.bind(this, "item-7")} className="item" id="item-7" role="link" tabindex="0" xlinkHref=" " xlinkTitle=" " transform="matrix(-1,0,0,-1,500,500)" data-svg-origin="250 250" style={SVGSliceStyle}><path fill={fillColour[6]} stroke="#111" d="M375,250 l125,0 A250,250 0 0,0 466.5063509461097,125.00000000000001 l-108.25317547305485,62.499999999999986 A125,125 0 0,1 375,250" className="sector"></path><use xlinkHref="#icon-7" width="35" height="35" x="437.2762756347656" y="177.63037109375" transform="rotate(75 454.7762756347656 195.13037109375)"></use></a>
              <a onClick={this.handleClick.bind(this, "item-8")} className="item" id="item-8" role="link" tabindex="0" xlinkHref=" " xlinkTitle=" " transform="matrix(-0.86602,0.5,-0.5,-0.86602,591.5063509461097,341.5063509461096)" data-svg-origin="250 250" style={SVGSliceStyle}><path fill={fillColour[7]} stroke="#111" d="M375,250 l125,0 A250,250 0 0,0 466.5063509461097,125.00000000000001 l-108.25317547305485,62.499999999999986 A125,125 0 0,1 375,250" className="sector"></path><use xlinkHref="#icon-8" width="35" height="35" x="437.2762756347656" y="177.63037109375" transform="rotate(75 454.7762756347656 195.13037109375)"></use></a>
              <a onClick={this.handleClick.bind(this, "item-9")} className="item" id="item-9" role="link" tabindex="0" xlinkHref=" " xlinkTitle=" " transform="matrix(-0.5,0.86602,-0.86602,-0.5,591.5063509461097,158.4936490538905)" data-svg-origin="250 250" style={SVGSliceStyle}><path fill={fillColour[8]} stroke="#111" d="M375,250 l125,0 A250,250 0 0,0 466.5063509461097,125.00000000000001 l-108.25317547305485,62.499999999999986 A125,125 0 0,1 375,250" className="sector"></path><use xlinkHref="#icon-9" width="35" height="35" x="437.2762756347656" y="177.63037109375" transform="rotate(75 454.7762756347656 195.13037109375)"></use></a>
              <a onClick={this.handleClick.bind(this, "item-10")} className="item" id="item-10" role="link" tabindex="0" xlinkHref=" " xlinkTitle=" " transform="matrix(0,1,-1,0,500.00000000000006,0)" data-svg-origin="250 250" style={SVGSliceStyle}><path fill={fillColour[9]} stroke="#111" d="M375,250 l125,0 A250,250 0 0,0 466.5063509461097,125.00000000000001 l-108.25317547305485,62.499999999999986 A125,125 0 0,1 375,250" className="sector"></path><use xlinkHref="#icon-10" width="35" height="35" x="437.2762756347656" y="177.63037109375" transform="rotate(75 454.7762756347656 195.13037109375)"></use></a>
              <a onClick={this.handleClick.bind(this, "item-11")} className="item" id="item-11" role="link" tabindex="0" xlinkHref=" " xlinkTitle=" " transform="matrix(0.5,0.86602,-0.86602,0.5,341.5063509461096,-91.5063509461097)" data-svg-origin="250 250" style={SVGSliceStyle}><path fill={fillColour[10]} stroke="#111" d="M375,250 l125,0 A250,250 0 0,0 466.5063509461097,125.00000000000001 l-108.25317547305485,62.499999999999986 A125,125 0 0,1 375,250" className="sector"></path><use xlinkHref="#icon-11" width="35" height="35" x="437.2762756347656" y="177.63037109375" transform="rotate(75 454.7762756347656 195.13037109375)"></use></a>
              <a onClick={this.handleClick.bind(this, "item-12")} className="item" id="item-12" role="link" tabindex="0" xlinkHref=" " xlinkTitle=" " transform="matrix(0.86602,0.5,-0.5,0.86602,158.49364905389052,-91.5063509461097)" data-svg-origin="250 250" style={SVGSliceStyle}><path fill={fillColour[11]} stroke="#111" d="M375,250 l125,0 A250,250 0 0,0 466.5063509461097,125.00000000000001 l-108.25317547305485,62.499999999999986 A125,125 0 0,1 375,250" className="sector"></path><use xlinkHref="#icon-12" width="35" height="35" x="437.2762756347656" y="177.63037109375" transform="rotate(75 454.7762756347656 195.13037109375)"></use></a>
          </g>


          <g id="trigger" className="trigger menu-trigger" role="button">
            <circle cx="250" cy="250" r="122"></circle>
            <text xmlns="http://www.w3.org/2000/svg" id="label" textAnchor="middle" alignmentBaseline="central" x="250" y="245" fill="#fff">-</text>
          </g>
        </svg>
    );
  }
}

class CyanDisplay extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      image: '',
      images: ''
    };

    this.handleUserInput = this.handleUserInput.bind(this);
    this.handleUserSelectSlice = this.handleUserSelectSlice.bind(this);
  }

  componentDidMount() {
    var self = this;

    $.ajax({
      url: this.props.source,
      dataType: 'json',
      success: (data) => {
        var firstImage = '';
        if (data[0]) {
          firstImage = data[0];

          // TODO - DRY me with below
          var bpStyleColour = parseColor(bc[firstImage.blueness_index - 1]);
          $('.menu-trigger').attr('fill', bpStyleColour);
        }

        self.setState({data: data, image: firstImage});
      },
      error: (xhr, status, err) => {
        console.error(self.props.source, status, err.toString());
      }
    });
  }

  componentWillUnmount() {
    this.serverRequest.abort();
  }

  handleUserInput(selectedImage) {
    this.highlightCurrentImage(selectedImage);

    this.setState({
      image: selectedImage
    });
  }

  handleUserSelectSlice(imageIndex) {
    var index = parseInt(imageIndex.replace("item-", "")) - 1;
    var selectedImage = this.state.data[index];
    console.log("####################### "+index);
    console.log(selectedImage);

    this.highlightCurrentImage(selectedImage);

    this.setState({
      image: selectedImage
    });
  }

  highlightCurrentImage(selectedImage) {
    var bpStyleColour = "#fff";
    if (selectedImage) {
      var bpStyleColour = parseColor(bc[selectedImage.blueness_index - 1]);
    }

    $('.menu-trigger').attr('fill', bpStyleColour);
    $('.blueness li').removeClass('border');
    $('.thumbnail').removeClass('border');
    $('.blueness li:nth-of-type('+selectedImage.blueness_index+')').addClass('border');
    $('#image'+selectedImage.id).addClass('border');
  }

  render() {
    console.log('CyanDisplay.render');

    var divStyle = {
      color: 'black',
      backgroundImage: 'url('+this.state.image.s3_url+')'
    };

    var shortURL = "";

    if (this.state.image.s3_url) {
      var urlSplit = this.state.image.s3_url.split("/");
      shortURL = urlSplit[urlSplit.length-1];
    }

    var bpStyleColour = "#000";
    if (this.state.image.blueness_index) {
      var bpStyleColour = parseColor(bc[this.state.image.blueness_index - 1]);
    }

    var bpStyle = {
      backgroundColor: bpStyleColour
    }

    var debugColour = "";
    if (getQueryParameter('debug') === 'true') {
      debugColour = <div className="debug colour"><ul className="blueness"></ul></div>;
    }


    return (
      <div>
        <div style={divStyle} className="cyan-display-main">
          <CyanPieMenu onUserSelectSlice={this.handleUserSelectSlice} images={this.state.data}/>
          <div className="debug meta">
            <ul className="data">
              <li><a href={this.state.image.s3_url}>{shortURL}</a></li>
              <li><img src={this.state.image.s3_url}></img></li>
              <li>{this.state.image.taken_at}</li>
              <li style={bpStyle}>{this.state.image.blueness_index} </li>
              <li>ID: {this.state.image.id} </li>
            </ul>
          </div>

          {debugColour}

        </div>
        <CyanThumbnails images={this.state.data} onUserInput={this.handleUserInput} />
      </div>
    );
  }
}

class CyanThumbnails extends React.Component {
  constructor(props) {
      super(props);

      this.handleUserInput = this.handleUserInput.bind(this);
  }

  handleUserInput(image) {
    console.log('CyanThumbnails.handleUserInput, image: '+image);
    this.props.onUserInput(
      image
    );
  }

  render() {
    console.log('CyanThumbnails.render');
    var rows = [];
    var rows2 = [];
    var lastCategory = null;
    if (this.props.images) {
      var MAX_IMAGES = 12;
      var index = 0;
      this.props.images.forEach(function(image) {
        if (index < MAX_IMAGES/2) {
          rows.push(<CyanThumbnail image={image} key={image.s3_url} onUserInput={this.handleUserInput} />);
        } else if (index >= MAX_IMAGES/2 && index < MAX_IMAGES) {
          rows2.push(<CyanThumbnail image={image} key={image.s3_url} onUserInput={this.handleUserInput} />);
        }
        index++;
      }.bind(this));

    }
    return (
      <section className="wrapper-large" id="thumbnails-wrapper">
        <div className='grid grid--medium' id="thumbnails">
          {rows}
        </div>
        <div className='grid grid--medium margin-top' id="thumbnails">
          {rows2}
        </div>
      </section>
    );
  }
}

class CyanThumbnail extends React.Component {
  constructor(props) {
      super(props);

      this.handleClick = this.handleClick.bind(this);
  }

  handleClick() {
    closePieMenu();
    $('.blueness li').removeClass('border');
    this.props.onUserInput(
      this.props.image
    );
  }

  render() {
    console.log('CyanThumbnail.render');
    var divStyle = {
      color: 'white',
      backgroundImage: 'url('+this.props.image.s3_url+')'
    };

    var imageId = "image"+this.props.image.id;

    return (
      <div id={imageId} className="thumbnail" style={divStyle} onClick={this.handleClick}>
        <p>
          {this.props.image.taken_at}
          <br/>
          ID: {this.props.image.id}
        </p>
      </div>
    );
  }
}

ReactDOM.render(
  <CyanDisplay source="/api/images"/>,
  document.getElementById("cyan-display")
)

// setInterval(function() {
//   ReactDOM.render(
//     <HelloWorld date={new Date()} />,
//     document.getElementById('hello-world')
//   );
// }, 500);

/* let's just pretend this isn't here, right? */
var svg = document.getElementById('menu'),
		items = svg.querySelectorAll('.item'),
    trigger = document.getElementById('trigger'),
    label = trigger.querySelectorAll('#label')[0],
    open = true,
    angle = 30;

//set up event handler
trigger.addEventListener('click', toggleMenu, false);
// svg.style.pointerEvents = "none";

//toggle menu when trigger is clicked
function toggleMenu(event) {
   if (!event) var event = window.event;
    event.stopPropagation();
  open = !open;

  if (open) {
    console.log("opening...");
    var tl = new TimelineLite();
  	tl.to(items, 0.2, {scale:1, ease:Back.easeOut.config(4)}, 0.05);
    for(var i=0; i<items.length; i++){
      tl.to(items[i], 0.7, {rotation:-i*angle + "deg", ease:Bounce.easeOut}, 0.35);
    }
    label.innerHTML = "-";
    svg.style.pointerEvents = "auto";
  } else {
    closePieMenu();
  }

}

function closePieMenu() {
  open = false;
  console.log("closing...");
  var tl = new TimelineLite();
  for(var i=0; i<items.length; i++){
    tl.to(items[i], 0.3, {rotation: 0, ease:Circ.easeOut}, 0.05);
  }
  tl.to(items, .3, {scale:0, ease:Back.easeIn}, 0.3);
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

/* END let's just pretend this isn't here, right? */
