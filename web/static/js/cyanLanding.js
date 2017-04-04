import React from "react"
import ReactDOM from "react-dom"
import moment from "moment"
import { CyanLandingImages } from "web/static/js/cyanLandingImages";
import { ImageUtils } from "web/static/js/imageUtils";

export class CyanLanding extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      image: '',
      images: '',
      initialLoad: true,
      allImagesLoaded: false,
    };

    this.handleUserInput = this.handleUserInput.bind(this);
  }

  componentDidMount() {
    console.log('CyanLanding.componentDidMount');
    var self = this;

    $.ajax({
      url: this.props.source,
      dataType: 'json',
      success: (data) => {
        var firstImage = '';
        console.log('data', data);
        if (data[0]) {
          firstImage = data[0];
        }

        self.setState({data: data, image: firstImage, initialLoad: false});
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
    this.setState({
      image: selectedImage,
    });
  }

  showLoadingGif() {
    $('#cyan-display').css("background", "url(/images/loading.gif) no-repeat center");
    $('#cyan-display').css("height", "300px");
    $("html, body").animate({ scrollTop: 0 }, "slow");
  }

  preloadAllImages(images) {
    if (!this.state.allImagesLoaded) {
      var allImages = images.length -1;
      var loadedCount = 0;
      var self = this;

      images.forEach(function(image){
        var img = new Image();
        console.log("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! preloading: "+image.s3_url);
        img.src = ImageUtils.thumbnailImage(image.s3_url);
        img.onload = function() {
          console.log("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! loadedCount: "+loadedCount+ "/"+allImages);
          loadedCount++;

          if (loadedCount == allImages) {
            console.log("!!!!!!!!!!!!!!!!!!!!!!!! ALL IMAGES LOADED !!!!!!!!!!!!!!!!!!!!");
            self.state.allImagesLoaded = true;
          }
        }
      });
    }
  }

  render() {
    console.log('===============================================================');
    console.log('CyanLanding.render');
    console.log('---------------------------------------------------------------');

    var tl = new TimelineLite();

    if (!this.state.allImagesLoaded) {
      this.showLoadingGif();
    }

    $('.cyan-display-main').css("visibility", "hidden");
    $('.debug.meta li').css("visibility", "hidden");
    $('#menu').css("visibility", "hidden");

    var divStyle = {
    };

    var img = new Image();
    console.log("preloading?: ",ImageUtils.mainImage(this.state.image.s3_url));

    if (this.state.image) {
      self = this;
      img.src = ImageUtils.mainImage(this.state.image.s3_url);
      var runAnimation = true;

      this.preloadAllImages(this.state.data);

      // Run up the first image & start animations
      img.onload = function() {
        if (runAnimation) {
          console.log("1st image LOADED! Starting animation..");

          $('.cyan-display-main').css("opacity", "0");
          $('.cyan-display-main').css("visibility", "visible");
          $('.debug.meta li').css("visibility", "visible");
          $('#cyan-display').css("background", "white");
          $('#cyan-display').css("height", "auto");

          // $('.cyan-display-main').css("background", "url("+ImageUtils.mainImage(self.state.image.s3_url)+") no-repeat");

          if (window.mobilecheck()) {
            $('.cyan-display-main').css("background-size", "360px 201px");
          }

          tl.to('.cyan-display-main', 1, { opacity:1 });


          tl.staggerFrom(".cyan-display-main .time span", 0.3,{ scale:0.5, opacity:0, delay:0.1, ease:Elastic.easeOut, force3D:true}, 0.1)
            .staggerFrom(".cyan-display-main .blueness span", 0.3,{ scale:0.5, opacity:0, delay:0.1, ease:Elastic.easeOut, force3D:true}, 0.1)
            .to('.menu-trigger #blueness-label', 0.5, { autoAlpha:1 })
            .to('.menu-trigger #blueness-label-suffix', 0.5, { autoAlpha:1 });
        }
      }
    }

    if (this.state.initialLoad) {
      this.showLoadingGif();
    }

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

    return (
      <div>
        <CyanLandingImages images={this.state.data} onUserInput={this.handleUserInput} />
      </div>
    );
  }
}
