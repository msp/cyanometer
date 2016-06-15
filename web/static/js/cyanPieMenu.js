import React from "react"
import ReactDOM from "react-dom"

export class CyanPieMenu extends React.Component {
  constructor(props) {
      super(props);

      this.handleClick = this.handleClick.bind(this);
  }

  handleClick(foo, e) {
    e.preventDefault();
    this.props.onUserSelectSlice(
      foo
    );
  }

  render() {
    console.log('CyanPieMenu.render');

    var SVGSliceStyle = {
      color: "red"
    };

    var fillColour = [];
    var imageIndex = 0;

    if (this.props.images) {
      this.props.images.forEach(function(image){
        fillColour[imageIndex] = parseColor(bc[image.blueness_index])
        imageIndex++;
      });
    }

    return (
        <svg xmlns="http://www.w3.org/2000/svg" xmlnsXlink="http://www.w3.org/1999/xlink" viewBox="-2 -2 504 504" id="menu">
          <g id="itemsContainer">
              <a onClick={this.handleClick.bind(this, "item-1")} className="item" id="item-1" role="link" tabindex="0" xlinkHref="#" xlinkTitle=" " transform="matrix(1,0,0,1,0,0)" data-svg-origin="250 250" style={SVGSliceStyle}><path fill={fillColour[0]} stroke="#111" d="M375,250 l125,0 A250,250 0 0,0 466.5063509461097,125.00000000000001 l-108.25317547305485,62.499999999999986 A125,125 0 0,1 375,250" className="sector"></path><use xlinkHref="#icon-1" width="35" height="35" x="437.2762756347656" y="177.63037109375" transform="rotate(75 454.7762756347656 195.13037109375)"></use></a>
              <a onClick={this.handleClick.bind(this, "item-2")} className="item" id="item-2" role="link" tabindex="0" xlinkHref=" " xlinkTitle=" " transform="matrix(0.86602,-0.49999,0.49999,0.86602,-91.50635094610965,158.4936490538903)" data-svg-origin="250 250" style={SVGSliceStyle}><path fill={fillColour[1]} stroke="#111" d="M375,250 l125,0 A250,250 0 0,0 466.5063509461097,125.00000000000001 l-108.25317547305485,62.499999999999986 A125,125 0 0,1 375,250" className="sector"></path><use xlinkHref="#icon-2" width="35" height="35" x="437.2762756347656" y="177.63037109375" transform="rotate(75 454.7762756347656 195.13037109375)"></use></a>
              <a onClick={this.handleClick.bind(this, "item-3")} className="item" id="item-3" role="link" tabindex="0" xlinkHref=" " xlinkTitle=" " transform="matrix(0.5,-0.86602,0.86602,0.5,-91.5063509461097,341.5063509461096)" data-svg-origin="250 250" style={SVGSliceStyle}><path fill={fillColour[2]} stroke="#111" d="M375,250 l125,0 A250,250 0 0,0 466.5063509461097,125.00000000000001 l-108.25317547305485,62.499999999999986 A125,125 0 0,1 375,250" className="sector"></path><use xlinkHref="#icon-3" width="35" height="35" x="437.2762756347656" y="177.63037109375" transform="rotate(75 454.7762756347656 195.13037109375)"></use></a>
              <a onClick={this.handleClick.bind(this, "item-4")} className="item" id="item-4" role="link" tabindex="0" xlinkHref=" " xlinkTitle=" " transform="matrix(0,-1,1,0,0,500)" data-svg-origin="250 250" style={SVGSliceStyle}><path fill={fillColour[3]} stroke="#111" d="M375,250 l125,0 A250,250 0 0,0 466.5063509461097,125.00000000000001 l-108.25317547305485,62.499999999999986 A125,125 0 0,1 375,250" className="sector"></path><use xlinkHref="#icon-4" width="35" height="35" x="437.2762756347656" y="177.63037109375" transform="rotate(75 454.7762756347656 195.13037109375)"></use></a>
              <a onClick={this.handleClick.bind(this, "item-5")} className="item" id="item-5" role="link" tabindex="0" xlinkHref=" " xlinkTitle=" " transform="matrix(-0.49999,-0.86602,0.86602,-0.49999,158.49364905389024,591.5063509461097)" data-svg-origin="250 250" style={SVGSliceStyle}><path fill={fillColour[4]} stroke="#111" d="M375,250 l125,0 A250,250 0 0,0 466.5063509461097,125.00000000000001 l-108.25317547305485,62.499999999999986 A125,125 0 0,1 375,250" className="sector"></path><use xlinkHref="#icon-5" width="35" height="35" x="437.2762756347656" y="177.63037109375" transform="rotate(75 454.7762756347656 195.13037109375)"></use></a>
              <a onClick={this.handleClick.bind(this, "item-6")} className="item" id="item-6" role="link" tabindex="0" xlinkHref=" " xlinkTitle=" " transform="matrix(-0.86602,-0.49999,0.49999,-0.86602,341.5063509461097,591.5063509461097)" data-svg-origin="250 250" style={SVGSliceStyle}><path fill={fillColour[5]} stroke="#111" d="M375,250 l125,0 A250,250 0 0,0 466.5063509461097,125.00000000000001 l-108.25317547305485,62.499999999999986 A125,125 0 0,1 375,250" className="sector"></path><use xlinkHref="#icon-6" width="35" height="35" x="437.2762756347656" y="177.63037109375" transform="rotate(75 454.7762756347656 195.13037109375)"></use></a>
              <a onClick={this.handleClick.bind(this, "item-7")} className="item" id="item-7" role="link" tabindex="0" xlinkHref=" " xlinkTitle=" " transform="matrix(-1,0,0,-1,500,500)" data-svg-origin="250 250" style={SVGSliceStyle}><path fill={fillColour[6]} stroke="#111" d="M375,250 l125,0 A250,250 0 0,0 466.5063509461097,125.00000000000001 l-108.25317547305485,62.499999999999986 A125,125 0 0,1 375,250" className="sector"></path><use xlinkHref="#icon-7" width="35" height="35" x="437.2762756347656" y="177.63037109375" transform="rotate(75 454.7762756347656 195.13037109375)"></use></a>
              <a onClick={this.handleClick.bind(this, "item-8")} className="item" id="item-8" role="link" tabindex="0" xlinkHref=" " xlinkTitle=" " transform="matrix(-0.86602,0.5,-0.5,-0.86602,591.5063509461097,341.5063509461096)" data-svg-origin="250 250" style={SVGSliceStyle}><path fill={fillColour[7]} stroke="#111" d="M375,250 l125,0 A250,250 0 0,0 466.5063509461097,125.00000000000001 l-108.25317547305485,62.499999999999986 A125,125 0 0,1 375,250" className="sector"></path><use xlinkHref="#icon-8" width="35" height="35" x="437.2762756347656" y="177.63037109375" transform="rotate(75 454.7762756347656 195.13037109375)"></use></a>
              <a onClick={this.handleClick.bind(this, "item-9")} className="item" id="item-9" role="link" tabindex="0" xlinkHref=" " xlinkTitle=" " transform="matrix(-0.5,0.86602,-0.86602,-0.5,591.5063509461097,158.4936490538905)" data-svg-origin="250 250" style={SVGSliceStyle}><path fill={fillColour[8]} stroke="#111" d="M375,250 l125,0 A250,250 0 0,0 466.5063509461097,125.00000000000001 l-108.25317547305485,62.499999999999986 A125,125 0 0,1 375,250" className="sector"></path><use xlinkHref="#icon-9" width="35" height="35" x="437.2762756347656" y="177.63037109375" transform="rotate(75 454.7762756347656 195.13037109375)"></use></a>
              <a onClick={this.handleClick.bind(this, "item-10")} className="item" id="item-10" role="link" tabindex="0" xlinkHref=" " xlinkTitle=" " transform="matrix(0,1,-1,0,500.00000000000006,0)" data-svg-origin="250 250" style={SVGSliceStyle}><path fill={fillColour[9]} stroke="#111" d="M375,250 l125,0 A250,250 0 0,0 466.5063509461097,125.00000000000001 l-108.25317547305485,62.499999999999986 A125,125 0 0,1 375,250" className="sector"></path><use xlinkHref="#icon-10" width="35" height="35" x="437.2762756347656" y="177.63037109375" transform="rotate(75 454.7762756347656 195.13037109375)"></use></a>
              <a onClick={this.handleClick.bind(this, "item-11")} className="item" id="item-11" role="link" tabindex="0" xlinkHref=" " xlinkTitle=" " transform="matrix(0.5,0.86602,-0.86602,0.5,341.5063509461096,-91.5063509461097)" data-svg-origin="250 250" style={SVGSliceStyle}><path fill={fillColour[10]} stroke="#111" d="M375,250 l125,0 A250,250 0 0,0 466.5063509461097,125.00000000000001 l-108.25317547305485,62.499999999999986 A125,125 0 0,1 375,250" className="sector"></path><use xlinkHref="#icon-11" width="35" height="35" x="437.2762756347656" y="177.63037109375" transform="rotate(75 454.7762756347656 195.13037109375)"></use></a>
              <a onClick={this.handleClick.bind(this, "item-12")} className="item" id="item-12" role="link" tabindex="0" xlinkHref=" " xlinkTitle=" " transform="matrix(0.86602,0.5,-0.5,0.86602,158.49364905389052,-91.5063509461097)" data-svg-origin="250 250" style={SVGSliceStyle}><path fill={fillColour[11]} stroke="#111" d="M375,250 l125,0 A250,250 0 0,0 466.5063509461097,125.00000000000001 l-108.25317547305485,62.499999999999986 A125,125 0 0,1 375,250" className="sector"></path><use xlinkHref="#icon-12" width="35" height="35" x="437.2762756347656" y="177.63037109375" transform="rotate(75 454.7762756347656 195.13037109375)"></use></a>
          </g>


          <g id="trigger" className="trigger menu-trigger" role="button">
            <circle cx="250" cy="250" r="122"></circle>
            <text xmlns="http://www.w3.org/2000/svg" id="blueness-label" textAnchor="middle" alignmentBaseline="central" x="250" y="245" fill="#fff">?</text>
            <text xmlns="http://www.w3.org/2000/svg" id="label" textAnchor="middle" alignmentBaseline="auto" x="250" y="340" fill="#fff">-</text>
          </g>
        </svg>
    );
  }
}
