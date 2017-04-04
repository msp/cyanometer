import React from "react"
import ReactDOM from "react-dom"

import { CyanLandingImage } from "web/static/js/cyanLandingImage";

export class CyanLandingImages extends React.Component {
  constructor(props) {
      super(props);

      this.handleUserInput = this.handleUserInput.bind(this);
  }

  componentDidMount() {
    console.log('CyanLandingImages.componentDidMount');
  }

  handleUserInput(image) {
    console.log('CyanLandingImages.handleUserInput, image: '+image);
    this.props.onUserInput(
      image
    );
  }

  render() {
    console.log('CyanLandingImages.render');
    const landingImages = [];

    if (this.props.images) {
      this.props.images.forEach(function(image) {
        landingImages.push(<CyanLandingImage image={image} key={image.s3_url} onUserInput={this.handleUserInput} />);
      }.bind(this));
    }

    return (
      <div className='grid grid--medium'>
        {landingImages}
      </div>
    );
  }
}
