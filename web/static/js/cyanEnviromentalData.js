import React from "react"
import ReactDOM from "react-dom"
import { IconCar } from "web/static/js/iconCar"
import { IconFactory } from "web/static/js/iconFactory"
import { IconHouse } from "web/static/js/iconHouse"
import { IconSun } from "web/static/js/iconSun"

export class CyanEnviromentalData extends React.Component {
  constructor(props) {
      super(props);

      this.state = {
        data: [],
        currentData: {}
      };

      this.handleClick = this.handleClick.bind(this);
  }

  componentDidMount() {
    var self = this;

    $.ajax({
      url: this.props.source,
      dataType: 'json',
      success: (data) => {
        console.log(data);
        self.setState({data: data, currentData: data[0]});
      },
      error: (xhr, status, err) => {
        console.error(self.props.source, status, err.toString());
      }
    });
  }

  handleClick() {
    // this.props.onUserInput(
    //   this.props.image
    // );
  }

  render() {
    console.log('CyanEnviromentalData.render');
    var divStyle = {
      // color: 'white',
      // backgroundImage: 'url('+this.props.image.s3_url+')'
    };

    var bigIcon;
    var fillColour = "#7ABC31";
    var icon = this.state.currentData.icon;
    switch (icon) {
      case "car":
        bigIcon = <IconCar fillColour={fillColour} />;
        break;
      case "factory":
        bigIcon = <IconFactory fillColour={fillColour} />;
        break;
      case "house":
        bigIcon = <IconHouse fillColour={fillColour} />;
        break;
      case "sun":
        bigIcon = <IconSun fillColour={fillColour} />;
        break;
      default:
        console.warn("Unknown icon! "+this.state.currentData.icon);
    }

    return (
      <div className="environmental-data" style={divStyle} onClick={this.handleClick}>
        <h4 className="section-title">Current Data</h4>
        {bigIcon}
        <p>
          The current level of air pollution is moderate
          <br />
          There are increased levels of Ozone
        </p>
        <p>
          Air pollution index: {this.state.currentData.air_pollution_index}
          <br />
          Taken at: {this.state.currentData.taken_at}
        </p>
      </div>
    );
  }
}
