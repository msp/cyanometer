import React from "react"
import ReactDOM from "react-dom"
import { CyanThumbnail } from "web/static/js/cyanThumbnail";

export class CyanThumbnails extends React.Component {
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
