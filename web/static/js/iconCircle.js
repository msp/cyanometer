import React from "react"
import ReactDOM from "react-dom"

export class IconCircle extends React.Component {
  constructor(props) {
      super(props);
  }

  render() {
    console.log('IconCircle.render');

    return (
      <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlnsXlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
      	 width="391px" height="381.038px" viewBox="0 0 391 381.038" enable-background="new 0 0 391 381.038" xmlSpace="preserve">
      <g>
      	<circle fill={this.props.fillColour} cx="195.5" cy="190.519" r="132.303"/>
      	<circle fill="none" stroke="#FFFFFF" stroke-width="12" stroke-miterlimit="10" cx="195.5" cy="190.519" r="132.303"/>
      </g>
      </svg>
    );
  }
}
