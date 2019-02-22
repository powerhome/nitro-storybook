import React, { Component } from "react";
import PropTypes from "prop-types";
import ProgressiveImage from 'react-progressive-image';
import image from 'images/giant.jpg';
import cool from  'images/clark.jpg';
// import { imagePath } from '../packs/pb_image.js'


const img = new Image(500, 300);
const img.onload = function() {
  // Here, you can reliably use `width` and `height`
  console.log("Loaded, size is " + this.width + "x" + this.height);
};
const img.src = 'images/giant.jpg';


// Custom Features of React-Progressive-Image
const compressedImage = cool.preSrc;
const palette = cool.palette;
const fullImage = cool.src;
const dominantImageColor = cool.palette[0];

const placeholder = (
  <div
      style={{ backgroundColor: dominantImageColor, height: fullImage.height, width: fullImage.width }}
  />
);

// Show me what I got!
console.log("fullImage:" + fullImage);
console.log("image:" + cool);
console.log("compressedImage:" + compressedImage);
console.log(placeholder);

const propTypes = {
  url: PropTypes.string.isRequired,
  compressedImage: PropTypes.string,
  palette: PropTypes.arrayOf(PropTypes.string),
  fullImage: PropTypes.string,
  dominantImageColor: PropTypes.string,
};

const defaultProps = {
  url: image,
  compressedImage: compressedImage,
  palette: palette,
  fullImage: fullImage,
  dominantImageColor: ''
};

class Image extends Component {
  render() {
    const { fullImage, compressedImage, palette } = this.props;
    return (  
        <div>
          <h4>{"Palette of colors:" + palette}</h4>
          <ProgressiveImage placeholder="" src={fullImage}>
              {(src, loading) => {
                return loading ? compressedImage : <img src={src} alt="an image" />;
              }}
          </ProgressiveImage>
        </div>
    );
  }
}

Image.propTypes = propTypes;
Image.defaultProps = defaultProps;

export default Image;
