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
      dataType: 'xml',
      success: (data) => {
        console.log(data);

        var root = $(data).find("postaja[sifra='E21']");
        var ozone = '??';
        var particles = '??';
        var sulphite = '??';
        var nitrogen = '??';

        if (root && root.find('o3').text()) {
          ozone = root.find('o3').text();
        }

        if (root && root.find('pm10').text()) {
          particles = root.find('pm10').text();
        }

        if (root && root.find('so2').text()) {
          sulphite = root.find('so2').text();
        }

        if (root && root.find('no2').text()) {
          nitrogen = root.find('no2').text();
        }

        console.log('ozone:  '+ozone+' particles:  '+particles+' sulphite:  '+sulphite+' nitrogen:  '+nitrogen);
        self.setState({ozone: ozone, particles: particles, sulphite: sulphite, nitrogen: nitrogen});
        // <postaja sifra="E21" ge_dolzina="14.512704" ge_sirina="46.065497" nadm_visina="299">
        //   <merilno_mesto>Ljubljana Bežigrad</merilno_mesto>
        //   <datum_od>2016-06-11 00:00</datum_od>
        //   <datum_do>2016-06-11 01:00</datum_do>
        //   <so2>5</so2>
        //   <co>0.2</co>
        //   <o3>39</o3>
        //   <no2>32</no2>
        //   <pm10>16</pm10>
        // </postaja>
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
            <td>Ozone (O3)</td>
            <td>Particles (PM10)</td>
            <td>Sulfur Dioxide (SO2) </td>
            <td>Nitrogen Dioxide (NO2) </td>
          </tr>
          <tr className="spacer">
            <td className="right-border"></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr>
            <td className="right-border">Concentration</td>
            <td>{this.state.ozone} µg/m³</td>
            <td>{this.state.particles} µg/m³</td>
            <td>{this.state.sulphite} µg/m³</td>
            <td>{this.state.nitrogen} µg/m³</td>
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
