import React from "react"
import ReactDOM from "react-dom"

export class IconFactory extends React.Component {
  constructor(props) {
      super(props);
  }

  render() {
    console.log('IconFactory.render');

    return (
      <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlnsXlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
      	 width="391px" height="381.038px" viewBox="0 0 391 381.038" enable-background="new 0 0 391 381.038" xmlSpace="preserve">
      <g>
      	<circle fill={this.props.fillColour} cx="195.5" cy="190.519" r="132.303"/>
      	<circle fill="none" stroke="#FFFFFF" stroke-width="12" stroke-miterlimit="10" cx="195.5" cy="190.519" r="132.303"/>
      	<path fill="#555555" d="M239.694,228.214h-88.719c-2.174,0-3.975-1.433-3.975-3.611v-69c0-2.178,1.801-3.389,3.975-3.389h15.773
      		c2.18,0,4.251,1.211,4.251,3.389v31.018l30.168-20.487c1.207-0.816,1.61-0.9,2.901-0.213c1.289,0.682,0.931,2.021,0.931,3.48
      		v18.042l31.344-21.268c1.207-0.844,3.001-0.953,4.31-0.273c1.301,0.68,2.346,2.029,2.346,3.5v55.202
      		C243,226.781,241.87,228.214,239.694,228.214z M155,220.214h80v-43.22l-29.887,21.262c-1.207,0.848-3.729,0.953-5.04,0.275
      		c-1.303-0.678-3.074-2.027-3.074-3.496v-18.211l-29.185,20.488c-1.203,0.816-2.095,0.902-3.392,0.215
      		c-1.287-0.684-1.423-2.023-1.423-3.48v-33.833h-8V220.214z"/>
      </g>
      </svg>
    );
  }
}
