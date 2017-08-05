import React from "react"
import ReactDOM from "react-dom"

export class CyanMeasurements extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      data: [],
    };

    this.handleUserInput = this.handleUserInput.bind(this);
  }

  componentDidMount() {
    var self = this;

    $.ajax({
      url: this.props.source,
      dataType: 'json',
      success: (data) => {
        console.log(data);
        self.setState(data);
      },
      error: (xhr, status, err) => {
        console.error(self.props.source, status, err.toString());
      }
    });
  }

  componentWillUnmount() {
    this.serverRequest.abort();
  }

  handleUserInput(selectedImage) {
  }

  render() {
    console.log('CyanMeasurements.render');

    var divStyle = {
    };

    return (
      <div style={divStyle} className="cyan-measurements">
        <h4 className="section-title">Measurements</h4>
        <table>
          <tbody>
          <tr>
            <td className="right-border">Pollutant</td>
            <td>Ozone (O<sub>3</sub>)</td>
            <td>Particles (PM<sub>10</sub>)</td>
            <td>Sulfur Dioxide (SO<sub>2</sub>) </td>
            <td>Nitrogen Dioxide (NO<sub>2</sub>) </td>
          </tr>
          <tr className="spacer">
            <td className="right-border"></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr>
            <td className="right-border">Concentration</td>
            <td className="concentration">{this.state.ozone} &micro;g/m³</td>
            <td className="concentration">{this.state.particles} &micro;g/m³</td>
            <td className="concentration">{this.state.sulphite} &micro;g/m³</td>
            <td className="concentration">{this.state.nitrogen} &micro;g/m³</td>
          </tr>
          <tr className="spacer">
            <td className="right-border"></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr>
            <td className="right-border">Main Source</td>
            <td>/</td>
            <td>Residential Wood Burning</td>
            <td>Industry</td>
            <td>Traffic</td>
          </tr>
          <tr>
            <td className="right-border"></td>
            <td className="table-icon"><img src="/images/cyano_icons_web_sun.svg"></img></td>
            <td className="table-icon"><img src="/images/cyano_icons_web_house.svg"></img></td>
            <td className="table-icon"><img src="/images/cyano_icons_web_factory.svg"></img></td>
            <td className="table-icon"><img src="/images/cyano_icons_web_car.svg"></img></td>
          </tr>
        </tbody>
        </table>
        <p className="measurements-caveat">*Particles with aerodynamic diameter less than 10 µm.</p>
      </div>
    );
  }
}
