import React from "react"
import ReactDOM from "react-dom"
import { CyanPieMenu } from "web/static/js/cyanPieMenu";
import { CyanThumbnails } from "web/static/js/cyanThumbnails";

export class CyanDisplay extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      image: '',
      images: ''
    };

    this.handleUserInput = this.handleUserInput.bind(this);
    this.handleUserSelectSlice = this.handleUserSelectSlice.bind(this);
  }

  componentDidMount() {
    var self = this;

    $.ajax({
      url: this.props.source,
      dataType: 'json',
      success: (data) => {
        var firstImage = '';
        if (data[0]) {
          firstImage = data[0];

          // TODO - DRY me with below
          var bpStyleColour = parseColor(bc[firstImage.blueness_index - 1]);
          $('.menu-trigger').attr('fill', bpStyleColour);
        }

        self.setState({data: data, image: firstImage});
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
    this.highlightCurrentImage(selectedImage);

    this.setState({
      image: selectedImage
    });
  }

  handleUserSelectSlice(imageIndex) {
    var index = parseInt(imageIndex.replace("item-", "")) - 1;
    var selectedImage = this.state.data[index];

    this.highlightCurrentImage(selectedImage);
    this.setState({
      image: selectedImage
    });
  }

  highlightCurrentImage(selectedImage) {
    var bpStyleColour = "#fff";
    if (selectedImage) {
      var bpStyleColour = parseColor(bc[selectedImage.blueness_index - 1]);
    }

    $('.menu-trigger').attr('fill', bpStyleColour);
    $('.blueness li').removeClass('border');
    $('.thumbnail').removeClass('border');
    $('.blueness li:nth-of-type('+selectedImage.blueness_index+')').addClass('border');
    $('#image'+selectedImage.id).addClass('border');
  }

  render() {
    console.log('CyanDisplay.render');

    var divStyle = {
      color: 'black',
      backgroundImage: 'url('+this.state.image.s3_url+')'
    };

    var shortURL = "";

    if (this.state.image.s3_url) {
      var urlSplit = this.state.image.s3_url.split("/");
      shortURL = urlSplit[urlSplit.length-1];
    }

    var bpStyleColour = "#000";
    if (this.state.image.blueness_index) {
      var bpStyleColour = parseColor(bc[this.state.image.blueness_index - 1]);
    }

    var bpStyle = {
      backgroundColor: bpStyleColour
    }

    var debugColour = "";
    if (getQueryParameter('debug') === 'true') {
      debugColour = <div className="debug colour"><ul className="blueness"></ul></div>;
    }


    return (
      <div>
        <div style={divStyle} className="cyan-display-main">
          <CyanPieMenu onUserSelectSlice={this.handleUserSelectSlice} images={this.state.data}/>
          <div className="debug meta">
            <ul className="data">
              <li><a href={this.state.image.s3_url}>{shortURL}</a></li>
              <li><img src={this.state.image.s3_url}></img></li>
              <li>{this.state.image.taken_at}</li>
              <li style={bpStyle}>{this.state.image.blueness_index} </li>
              <li>ID: {this.state.image.id} </li>
            </ul>
          </div>

          {debugColour}

        </div>
        <CyanThumbnails images={this.state.data} onUserInput={this.handleUserInput} />
      </div>
    );
  }
}
