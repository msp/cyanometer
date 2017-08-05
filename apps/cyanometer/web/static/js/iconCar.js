import React from "react"
import ReactDOM from "react-dom"

export class IconCar extends React.Component {
  constructor(props) {
      super(props);
  }

  render() {
    console.log('IconCar.render');

    return (
      <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlnsXlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
      	 width="391px" height="381.038px" viewBox="0 0 391 381.038" enable-background="new 0 0 391 381.038" xmlSpace="preserve">
      <g>
      	<circle fill={this.props.fillColour} cx="195.275" cy="190.115" r="132.303"/>
      	<circle fill="none" stroke="#FFFFFF" strokeWidth="12" strokeMiterlimit="10" cx="195.275" cy="190.115" r="132.303"/>
      	<path fill="#555555" d="M244.131,173.214h-21.594l-18.449-13.59c-0.684-0.523-1.52-0.41-2.383-0.41h-26.004
      		c-1.195,0-2.324,0.146-3.07,1.072l-10.732,12.928h-15.361c-2.176,0-4.537,1.499-4.537,3.677v29.572
      		c0,2.178,2.361,4.751,4.537,4.751h9.543c1.32,6,6.453,10.025,12.578,10.025s11.25-4.025,12.566-10.025h31.215
      		c1.309,6,6.441,10.025,12.566,10.025s11.258-4.025,12.574-10.025h6.551c2.172,0,3.869-2.573,3.869-4.751v-29.572
      		C248,174.713,246.303,173.214,244.131,173.214z M168.658,213.845c-1.984,0-3.723-0.631-4.695-2.631h9.387
      		C172.377,213.214,170.639,213.845,168.658,213.845z M225.006,213.845c-1.98,0-3.721-0.631-4.691-2.631h9.387
      		C228.725,213.214,226.99,213.845,225.006,213.845z M240,203.214h-92v-22h15.779c1.195,0,2.32-1.148,3.066-2.078l10.742-11.922
      		h22.789l18.457,12.594c0.688,0.516,1.518,1.406,2.375,1.406H240V203.214z"/>
      </g>
      </svg>
    );
  }
}
