import React from "react"
import ReactDOM from "react-dom"

export class CyanThumbnail extends React.Component {
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