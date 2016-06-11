import React from "react"
import ReactDOM from "react-dom"
import { CyanPieMenu } from "web/static/js/cyanPieMenu";
import { CyanThumbnails } from "web/static/js/cyanThumbnails";

export class CyanDisplay extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      image: '',
      images: '',
      shouldOpenMenu: true,
      initialLoad: true,
      shouldCloseMenu: false,
      allImagesLoaded: false
    };

    this.handleUserInput = this.handleUserInput.bind(this);
    this.handleUserSelectSlice = this.handleUserSelectSlice.bind(this);
  }

  componentDidMount() {
    console.log('CyanDisplay.componentDidMount');
    var self = this;

    $.ajax({
      url: this.props.source,
      dataType: 'json',
      success: (data) => {
        var firstImage = '';
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
    this.highlightCurrentImage(selectedImage);

    this.setState({
      image: selectedImage,
      shouldOpenMenu: false,
      shouldCloseMenu: true
    });
  }

  handleUserSelectSlice(imageIndex) {
    var index = parseInt(imageIndex.replace("item-", "")) - 1;
    var selectedImage = this.state.data[index];

    this.highlightCurrentImage(selectedImage);
    this.setState({
      image: selectedImage,
      shouldOpenMenu: true,
      shouldCloseMenu: false
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

  showLoadingGif() {
    $('#cyan-display').css("background", "url(/images/loading.gif) no-repeat center");
    $('#cyan-display').css("height", "300px");
  }

  preloadAllImages(images) {
    if (!this.state.allImagesLoaded) {
      var allImages = images.length -1;
      var loadedCount = 0;
      var self = this;

      images.forEach(function(image){
        var img = new Image();
        console.log("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! preloading: "+image.s3_url);
        img.src = image.s3_url;
        img.onload = function() {
          console.log("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! loadedCount: "+loadedCount+ "/"+allImages);
          loadedCount++;

          if (loadedCount == allImages) {
            console.log("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ALL LOADED !!!!!!!");
            self.state.allImagesLoaded = true;
          }
        }
      });
    }
  }

  render() {
    console.log('CyanDisplay.render');
    var tl = new TimelineLite();

    if (!this.state.allImagesLoaded) {
      this.showLoadingGif();
    }


    console.log("********************************* shouldCloseMenu? "+this.state.shouldCloseMenu);
    if (this.state.shouldCloseMenu) {
      open = false;
      svg = document.getElementById('menu');
      items = svg.querySelectorAll('.item');
      // trigger = document.getElementById('trigger');
      // label = trigger.querySelectorAll('#label')[0];
      // open = true;
      // angle = 30;

      for(var i=0; i<items.length; i++){
        tl.to(items[i], 0.3, {rotation: 0, ease:Circ.easeOut}, 0.05);
      }
      tl.to(items, .3, {scale:0, ease:Back.easeIn}, 0.3)
        .to(trigger, 0.6, {scale:0.5, transformOrigin: "50% 50%", ease: Expo.easeInOut }, 0)
      label.innerHTML = "+";
      svg.style.pointerEvents = "none";
    }


    // tl.from('.cyan-display-main', 0.3, { autoAlpha:0 });
    $('.cyan-display-main').css("visibility", "hidden");
    $('.debug.meta li').css("visibility", "hidden");
    $('#thumbnails-wrapper').css("visibility", "hidden");
    $('#menu').css("visibility", "hidden");

    var divStyle = {
    };

    var img = new Image();
    console.log("*****************************************************");
    console.log("preloading?: "+this.state.image.s3_url);

    if (this.state.image) {
      self = this;
      img.src = this.state.image.s3_url;
      var runAnimation = true;

      this.preloadAllImages(this.state.data);

      // Run up the first image & start animations
      img.onload = function() {
        if (runAnimation) {
          console.log("********************************* IMAGE LOADED!");

          $('.cyan-display-main').css("opacity", "0");
          $('.cyan-display-main').css("visibility", "visible");
          $('#thumbnails-wrapper').css("visibility", "visible");
          $('.debug.meta li').css("visibility", "visible");
          $('#menu').css("visibility", "visible");
          $('#cyan-display').css("background", "white");
          $('#cyan-display').css("height", "auto");

          // $('.cyan-display-main').css("opacity", 1);
          $('.cyan-display-main').css("background", "url("+self.state.image.s3_url+") no-repeat");

          tl.to('.cyan-display-main', 1, { opacity:1 });
          // tl.from('.cyan-display-main', 0.3, { scale: 0.8, autoAlpha:0 });
          // tl.from('.cyan-display-main', 0.3, { x: -1200 });

          tl.staggerFrom(".debug.meta li", 0.3,{ scale:0.5, opacity:0, delay:0.1, ease:Elastic.easeOut, force3D:true}, 0.1);



          console.log("********** MENU? "+self.state.shouldOpenMenu);
          if (self.state.shouldOpenMenu) {
            var bpStyleColour = parseColor(bc[self.state.image.blueness_index - 1]);
            $('.menu-trigger').attr('fill', bpStyleColour);

            tl.from('#trigger', 0.3, {scale:0.5, autoAlpha:0, transformOrigin: "50% 50%", ease: Expo.easeInOut })
            tl.staggerFrom('.item', 0.2, { scale:0.5, autoAlpha:0, delay:0.1}, 0.05);
            // TweenMax.from('#trigger', 0.3, { opacity:0}, 0.1);
          }
        }
      }
    }

    // TESTING loader only!
    // if (!runAnimation) {
    //   $('.cyan-display-main').css("visibility", "hidden");
    //   $('#thumbnails-wrapper').css("visibility", "hidden");
    // }

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
