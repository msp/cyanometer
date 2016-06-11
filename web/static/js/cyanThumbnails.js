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
    // console.log('********************* REFS');
    // console.log(this.refs);

    // console.log(this.props._input);

    if (this.myTextInput !== null) {
      var container = ReactDOM.findDOMNode(this.myTextInput);
      console.log(container);
      // console.log(container.querySelectorAll('.thumbnail'));
    }
    // console.log(this.refs.msp2);
    // console.log(this.refs.msp);

    // var container = ReactDOM.findDOMNode(this.refs.msp);

    // console.log(container.children[0]);
    // console.log($(container).find('.thumbnail'));
    // TweenMax.staggerFrom(container, 1,
    //                     {
    //                       scale:0.5, opacity:0, delay:0.1,
    //                       ease:Elastic.easeOut, force3D:true},
    //                     0.2);

    // console.log('END ********************* REFS');

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
          rows2.push(<CyanThumbnail  image={image} key={image.s3_url} onUserInput={this.handleUserInput} />);
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
