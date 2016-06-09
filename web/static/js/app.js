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

class CyanDisplay extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      image: '',
      images: ''
    };

    this.handleUserInput = this.handleUserInput.bind(this);
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

  render() {
    console.log('CyanDisplay.render');

    var divStyle = {
      color: 'black',
      backgroundImage: 'url('+this.state.image.s3_url+')'
    };

    return (
      <div>
        <div style={divStyle} className="cyan-display-main">
          <ul className="debug">
            <li><a href={this.state.image.s3_url}>{this.state.image.s3_url}</a></li>
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
    console.log('CyanThumbnails.render, this.props.images: '+this.props.images);
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
