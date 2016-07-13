import React from "react"
import ReactDOM from "react-dom"
import { CyanThumbnail } from "web/static/js/cyanThumbnail";

export class CyanThumbnails extends React.Component {
  constructor(props) {
      super(props);

      this.handleUserInput = this.handleUserInput.bind(this);
  }

  componentDidMount() {
    console.log('CyanThumbnails.componentDidMount');
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
      var maxImages = MAX_IMAGES;
      if (window.mobilecheck()) {
        maxImages = 2;
      }

      var index = 0;
      this.props.images.forEach(function(image) {
        if (index < maxImages/2) {
          rows.push(<div className='thumbnail-wrapper'><CyanThumbnail image={image} key={image.s3_url} onUserInput={this.handleUserInput} /></div>);
        } else if (index >= maxImages/2 && index < maxImages) {
          rows2.push(<div className='thumbnail-wrapper'><CyanThumbnail  image={image} key={image.s3_url} onUserInput={this.handleUserInput} /></div>);
        }
        index++;
      }.bind(this));

    }

    // console.log(' ********************* KIDS');
    // var index = 0;
    // console.log("children");
    // var rowsWithRef = React.Children.map(rows, function (child) {
    //   console.log("child", child)
    //   return React.cloneElement(child, {
    //       ref: 'child-' + (index++)
    //   });
    // });
    //
    // console.log('END ********************* KIDS');

    return (
      <section className="wrapper-large" id="thumbnails-wrapper">
        <div className='grid grid--medium thumbnails'>
          {rows}
        </div>
        <div className='grid grid--medium margin-top thumbnails'>
          {rows2}
        </div>
      </section>
    );
  }
}
