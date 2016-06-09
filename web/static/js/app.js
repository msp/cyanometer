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

class CyanPieMenu extends React.Component {
  constructor(props) {
      super(props);

      this.handleClick = this.handleClick.bind(this);
  }

  handleClick(foo, e) {
    // console.log("this");
    // console.log(this);
    // console.log("foo");
    // console.log(foo);
    // console.log("e");
    // console.log(e);
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

    return (
        <svg xmlns="http://www.w3.org/2000/svg" xmlnsXlink="http://www.w3.org/1999/xlink" viewBox="-2 -2 504 504" id="menu">
          <g id="itemsContainer">
              <a onClick={this.handleClick.bind(this, "item-1")} className="item" id="item-1" role="link" tabindex="0" xlinkHref="#" xlinkTitle=" " transform="matrix(1,0,0,1,0,0)" data-svg-origin="250 250" style={SVGSliceStyle}><path fill="none" stroke="#111" d="M375,250 l125,0 A250,250 0 0,0 466.5063509461097,125.00000000000001 l-108.25317547305485,62.499999999999986 A125,125 0 0,1 375,250" className="sector"></path><use xlinkHref="#icon-1" width="35" height="35" x="437.2762756347656" y="177.63037109375" transform="rotate(75 454.7762756347656 195.13037109375)"></use></a>
              <a onClick={this.handleClick.bind(this, "item-2")} className="item" id="item-2" role="link" tabindex="0" xlinkHref=" " xlinkTitle=" " transform="matrix(0.86602,-0.49999,0.49999,0.86602,-91.50635094610965,158.4936490538903)" data-svg-origin="250 250" style={SVGSliceStyle}><path fill="none" stroke="#111" d="M375,250 l125,0 A250,250 0 0,0 466.5063509461097,125.00000000000001 l-108.25317547305485,62.499999999999986 A125,125 0 0,1 375,250" className="sector"></path><use xlinkHref="#icon-2" width="35" height="35" x="437.2762756347656" y="177.63037109375" transform="rotate(75 454.7762756347656 195.13037109375)"></use></a>
              <a onClick={this.handleClick.bind(this, "item-3")} className="item" id="item-3" role="link" tabindex="0" xlinkHref=" " xlinkTitle=" " transform="matrix(0.5,-0.86602,0.86602,0.5,-91.5063509461097,341.5063509461096)" data-svg-origin="250 250" style={SVGSliceStyle}><path fill="none" stroke="#111" d="M375,250 l125,0 A250,250 0 0,0 466.5063509461097,125.00000000000001 l-108.25317547305485,62.499999999999986 A125,125 0 0,1 375,250" className="sector"></path><use xlinkHref="#icon-3" width="35" height="35" x="437.2762756347656" y="177.63037109375" transform="rotate(75 454.7762756347656 195.13037109375)"></use></a>
              <a onClick={this.handleClick.bind(this, "item-4")} className="item" id="item-4" role="link" tabindex="0" xlinkHref=" " xlinkTitle=" " transform="matrix(0,-1,1,0,0,500)" data-svg-origin="250 250" style={SVGSliceStyle}><path fill="none" stroke="#111" d="M375,250 l125,0 A250,250 0 0,0 466.5063509461097,125.00000000000001 l-108.25317547305485,62.499999999999986 A125,125 0 0,1 375,250" className="sector"></path><use xlinkHref="#icon-4" width="35" height="35" x="437.2762756347656" y="177.63037109375" transform="rotate(75 454.7762756347656 195.13037109375)"></use></a>
              <a onClick={this.handleClick.bind(this, "item-5")} className="item" id="item-5" role="link" tabindex="0" xlinkHref=" " xlinkTitle=" " transform="matrix(-0.49999,-0.86602,0.86602,-0.49999,158.49364905389024,591.5063509461097)" data-svg-origin="250 250" style={SVGSliceStyle}><path fill="none" stroke="#111" d="M375,250 l125,0 A250,250 0 0,0 466.5063509461097,125.00000000000001 l-108.25317547305485,62.499999999999986 A125,125 0 0,1 375,250" className="sector"></path><use xlinkHref="#icon-5" width="35" height="35" x="437.2762756347656" y="177.63037109375" transform="rotate(75 454.7762756347656 195.13037109375)"></use></a>
              <a onClick={this.handleClick.bind(this, "item-6")} className="item" id="item-6" role="link" tabindex="0" xlinkHref=" " xlinkTitle=" " transform="matrix(-0.86602,-0.49999,0.49999,-0.86602,341.5063509461097,591.5063509461097)" data-svg-origin="250 250" style={SVGSliceStyle}><path fill="none" stroke="#111" d="M375,250 l125,0 A250,250 0 0,0 466.5063509461097,125.00000000000001 l-108.25317547305485,62.499999999999986 A125,125 0 0,1 375,250" className="sector"></path><use xlinkHref="#icon-6" width="35" height="35" x="437.2762756347656" y="177.63037109375" transform="rotate(75 454.7762756347656 195.13037109375)"></use></a>
              <a onClick={this.handleClick.bind(this, "item-7")} className="item" id="item-7" role="link" tabindex="0" xlinkHref=" " xlinkTitle=" " transform="matrix(-1,0,0,-1,500,500)" data-svg-origin="250 250" style={SVGSliceStyle}><path fill="none" stroke="#111" d="M375,250 l125,0 A250,250 0 0,0 466.5063509461097,125.00000000000001 l-108.25317547305485,62.499999999999986 A125,125 0 0,1 375,250" className="sector"></path><use xlinkHref="#icon-7" width="35" height="35" x="437.2762756347656" y="177.63037109375" transform="rotate(75 454.7762756347656 195.13037109375)"></use></a>
              <a onClick={this.handleClick.bind(this, "item-8")} className="item" id="item-8" role="link" tabindex="0" xlinkHref=" " xlinkTitle=" " transform="matrix(-0.86602,0.5,-0.5,-0.86602,591.5063509461097,341.5063509461096)" data-svg-origin="250 250" style={SVGSliceStyle}><path fill="none" stroke="#111" d="M375,250 l125,0 A250,250 0 0,0 466.5063509461097,125.00000000000001 l-108.25317547305485,62.499999999999986 A125,125 0 0,1 375,250" className="sector"></path><use xlinkHref="#icon-8" width="35" height="35" x="437.2762756347656" y="177.63037109375" transform="rotate(75 454.7762756347656 195.13037109375)"></use></a>
              <a onClick={this.handleClick.bind(this, "item-9")} className="item" id="item-9" role="link" tabindex="0" xlinkHref=" " xlinkTitle=" " transform="matrix(-0.5,0.86602,-0.86602,-0.5,591.5063509461097,158.4936490538905)" data-svg-origin="250 250" style={SVGSliceStyle}><path fill="none" stroke="#111" d="M375,250 l125,0 A250,250 0 0,0 466.5063509461097,125.00000000000001 l-108.25317547305485,62.499999999999986 A125,125 0 0,1 375,250" className="sector"></path><use xlinkHref="#icon-9" width="35" height="35" x="437.2762756347656" y="177.63037109375" transform="rotate(75 454.7762756347656 195.13037109375)"></use></a>
              <a onClick={this.handleClick.bind(this, "item-10")} className="item" id="item-10" role="link" tabindex="0" xlinkHref=" " xlinkTitle=" " transform="matrix(0,1,-1,0,500.00000000000006,0)" data-svg-origin="250 250" style={SVGSliceStyle}><path fill="none" stroke="#111" d="M375,250 l125,0 A250,250 0 0,0 466.5063509461097,125.00000000000001 l-108.25317547305485,62.499999999999986 A125,125 0 0,1 375,250" className="sector"></path><use xlinkHref="#icon-10" width="35" height="35" x="437.2762756347656" y="177.63037109375" transform="rotate(75 454.7762756347656 195.13037109375)"></use></a>
              <a onClick={this.handleClick.bind(this, "item-11")} className="item" id="item-11" role="link" tabindex="0" xlinkHref=" " xlinkTitle=" " transform="matrix(0.5,0.86602,-0.86602,0.5,341.5063509461096,-91.5063509461097)" data-svg-origin="250 250" style={SVGSliceStyle}><path fill="none" stroke="#111" d="M375,250 l125,0 A250,250 0 0,0 466.5063509461097,125.00000000000001 l-108.25317547305485,62.499999999999986 A125,125 0 0,1 375,250" className="sector"></path><use xlinkHref="#icon-11" width="35" height="35" x="437.2762756347656" y="177.63037109375" transform="rotate(75 454.7762756347656 195.13037109375)"></use></a>
              <a onClick={this.handleClick.bind(this, "item-12")} className="item" id="item-12" role="link" tabindex="0" xlinkHref=" " xlinkTitle=" " transform="matrix(0.86602,0.5,-0.5,0.86602,158.49364905389052,-91.5063509461097)" data-svg-origin="250 250" style={SVGSliceStyle}><path fill="none" stroke="#111" d="M375,250 l125,0 A250,250 0 0,0 466.5063509461097,125.00000000000001 l-108.25317547305485,62.499999999999986 A125,125 0 0,1 375,250" className="sector"></path><use xlinkHref="#icon-12" width="35" height="35" x="437.2762756347656" y="177.63037109375" transform="rotate(75 454.7762756347656 195.13037109375)"></use></a>
          </g>


          <g id="trigger" className="trigger menu-trigger" role="button">
            <circle cx="250" cy="250" r="30"></circle>
            <text xmlns="http://www.w3.org/2000/svg" id="label" text-anchor="middle" x="250" y="255" fill="#fff" font-size="1.5em">-</text>
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

  handleUserInput(image) {
    this.setState({
      image: image
    });
  }

  handleUserSelectSlice(imageIndex) {
    var index = parseInt(imageIndex.replace("item-", "")) - 1;
    var selectedImage = this.state.data[index];
    console.log("####################### "+index);
    console.log(selectedImage);

    this.setState({
      image: selectedImage
    });
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

    return (
      <div>
        <div style={divStyle} className="cyan-display-main">
          <CyanPieMenu onUserSelectSlice={this.handleUserSelectSlice} />
          <ul className="debug">
            <li><a href={this.state.image.s3_url}>{shortURL}</a></li>
            <li><img src={this.state.image.s3_url}></img></li>
            <li>{this.state.image.taken_at}</li>
            <li>blueness_index: {this.state.image.blueness_index} </li>
            <li>air_pollution_index: {this.state.image.air_pollution_index} </li>
            <li>icon: {this.state.image.icon} </li>
          </ul>
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
    var lastCategory = null;
    if (this.props.images) {
      var MAX_IMAGES = 6;
      var index = 0;
      this.props.images.forEach(function(image) {
        if (index < MAX_IMAGES) {
          rows.push(<CyanThumbnail image={image} key={image.s3_url} onUserInput={this.handleUserInput} />);
        }
        index++;
      }.bind(this));
    }
    return (
      <section className="wrapper-large" id="thumbnails-wrapper">
        <div className='grid grid--medium' id="thumbnails">
          {rows}
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

    return (
      <div className="thumbnail" style={divStyle} onClick={this.handleClick}>
        <p>{this.props.image.blueness_index}</p>
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

console.log(items);

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
