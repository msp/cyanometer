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

var IMAGES = [
  {
    "taken_at": "2015-09-23T03:23:37Z",
    "s3_url": "http://cyanometer.s3.aws.com/12345",
    "blueness_index": "4"
  },
  {
    "taken_at": "2016-06-05T16:04:17Z",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/sky-05.06.2016-16_04_16-large.jpg",
    "blueness_index": "4"
  },
  {
    "taken_at": "2016-06-07T08:42:58Z",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/sky-07.06.2016-08_42_57-large.jpg",
    "blueness_index": "51"
  },
  {
    "taken_at": "2016-06-07T08:50:39Z",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/sky-07.06.2016-08_50_39-large.jpg",
    "blueness_index": "51"
  },
  {
    "taken_at": "2016-06-07T08:57:59Z",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/sky-07.06.2016-08_57_59-large.jpg",
    "blueness_index": "51"
  },
  {
    "taken_at": "2016-06-07T09:03:26Z",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/sky-07.06.2016-09_03_26-large.jpg",
    "blueness_index": "51"
  },
  {
    "taken_at": "2016-06-07T07:25:38Z",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/sky-07.06.2016-09_25_38-large.jpg",
    "blueness_index": "50"
  },
  {
    "taken_at": "2016-06-07T07:25:38Z",
    "s3_url": "https://s3.eu-central-1.amazonaws.com/cyanometer/sky-07.06.2016-09_25_39-large.jpg",
    "blueness_index": "50"
  }
]


import React from "react"
import ReactDOM from "react-dom"

class CyanDisplay extends React.Component {
  render() {
    return (
      <div>
        <img src="http://placehold.it/1200x800" />
        <CyanThumbnails images={this.props.images} />
      </div>
    );
  }
}

class CyanThumbnails extends React.Component {
  render() {
    var rows = [];
    var lastCategory = null;
    this.props.images.forEach(function(image) {
      rows.push(<CyanThumbnail image={image} key={image.s3_url} />);
    });
    return (
      <div className='grid' id="thumbnails">
        {rows}
      </div>
    );
  }
}

class CyanThumbnail extends React.Component {
  render() {
    var divStyle = {
      color: 'white',
      backgroundImage: 'url(' + 'http://placehold.it/150x150' + ')'
    };

    return (
      <div className="thumbnail" style={divStyle}>
        <p>{this.props.image.blueness_index}</p>
      </div>
    );
  }
}

ReactDOM.render(
  <CyanDisplay images={IMAGES}/>,
  document.getElementById("cyan-display")
)

// setInterval(function() {
//   ReactDOM.render(
//     <HelloWorld date={new Date()} />,
//     document.getElementById('hello-world')
//   );
// }, 500);
