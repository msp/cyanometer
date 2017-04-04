import React from "react"
import ReactDOM from "react-dom"
import moment from "moment"

import { ImageUtils } from "web/static/js/imageUtils";

export class CyanLandingImage extends React.Component {
  constructor(props) {
      super(props);

      this.handleClick = this.handleClick.bind(this);
  }

  componentDidMount() {
    console.log('CyanLandingImage.componentDidMount');
  }

  handleClick() {
    window.location.href='/location/'+this.props.image.location_id
  }

  render() {
    console.log('CyanLandingImage.render');
    var divStyle = {
      backgroundImage: 'url('+ImageUtils.mainImage(this.props.image.s3_url)+')'
    };

    const dateMask = "DD/MM/YYYY HH:mm"
    var dateTimeTakenAt = moment(this.props.image.taken_at).format(dateMask);


    return (
      <div style={divStyle} className="cyan-display-main landing-image" onClick={this.handleClick}>
        <div className="time">
          <span>LJUBLJANA SKY</span>
          <br/>
          <span>{dateTimeTakenAt}</span>
        </div>
        <div className="calendar"></div>
      </div>
    );
  }
}
