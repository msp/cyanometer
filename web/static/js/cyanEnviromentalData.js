import React from "react"
import ReactDOM from "react-dom"
import { IconCar } from "web/static/js/iconCar"
import { IconFactory } from "web/static/js/iconFactory"
import { IconHouse } from "web/static/js/iconHouse"
import { IconSun } from "web/static/js/iconSun"
import { IconCircle } from "web/static/js/iconCircle"

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
        self.setState({data: data, currentData: data[0]});
      },
      error: (xhr, status, err) => {
        console.error(self.props.source, status, err.toString());
      }
    });
  }

  handleClick() {
  }

  render() {
    console.log('CyanEnviromentalData.render');
    var divStyle = {
    };

    var bigIcon;
    var levelsText="";
    var pollutionText="";
    var fillColour = "white";

    var air_pollution_index = this.state.currentData.air_pollution_index;
    // var air_pollution_index = "1";
    switch (air_pollution_index) {
      case "1":
        pollutionText = "LOW";
        fillColour = "#72B22F";
        break;
      case "2":
        pollutionText = "MODERATE";
        fillColour = "#FEF10D";
        break;
      case "3":
        pollutionText = "HIGH";
        fillColour = "#F17E19";
        break;
      case "4":
        pollutionText = "VERY HIGH";
        fillColour = "#E4001C";
        break;
      default:
        pollutionText = "UNKNOWN";
        if (this.state.currentData.air_pollution_index) {
          console.warn("Unknown air_pollution_index! "+this.state.currentData.air_pollution_index);
        }
    }

    //override if LOW pollution
    var icon;
    if (air_pollution_index == "1") {
      icon = "circle";
    } else {
      icon = this.state.currentData.icon;
    }

    switch (icon) {
      case "car":
        bigIcon = <IconCar fillColour={fillColour} />;
        levelsText = "NITROGEN DIOXIDE";
        break;
      case "factory":
        bigIcon = <IconFactory fillColour={fillColour} />;
        levelsText = "SULPHITE DIOXIDE";
        break;
      case "house":
        bigIcon = <IconHouse fillColour={fillColour} />;
        levelsText = "PARTICLES";
        break;
      case "sun":
        bigIcon = <IconSun fillColour={fillColour} />;
        levelsText = "OZONE";
        break;
      case "circle":
        bigIcon = <IconCircle fillColour={fillColour} />;
        break;
      default:
        if (this.state.currentData.icon) {
          console.warn("Unknown icon! "+this.state.currentData.icon);
        }
    }


    var description = "";
    if (parseInt(air_pollution_index) > 1) {
      description =
      <p>
        The current level of air pollution is {pollutionText}
        <br />
        There are increased levels of {levelsText}
      </p>;
    }

    return (
      <div className="environmental-data" style={divStyle} onClick={this.handleClick}>
        <h4 className="section-title">Current Data</h4>
        {bigIcon}
        {description}
      </div>
    );
  }
}
