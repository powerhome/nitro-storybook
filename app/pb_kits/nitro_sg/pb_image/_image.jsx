import React, { Component } from "react";
import PropTypes from "prop-types";
import lqip from "lqip.macro";
import IdealImage from "react-ideal-image";
import image from 'images/giant.jpg'
const filler = lqip('images/giant.jpg');

const propTypes = {
  url: PropTypes.string.isRequired,
  alt: PropTypes.string,
  width: PropTypes.number,
  height: PropTypes.number,
  placeholder: PropTypes.string.isRequired
};

const defaultProps = {
  url: "",
  alt: "alt-reference",
  width: 3500,
  height: 2000,
  placeholder: filler
};

class Image extends Component {
  render() {
    const {  alt, width, height, placeholder } = this.props;
    return (
      <IdealImage
          alt={alt}
          height={height}
          placeholder={placeholder}
          srcSet={[{ src: image, width: width }]}
          width={width}
      />
    );
  }
}

Image.propTypes = propTypes;
Image.defaultProps = defaultProps;

export default Image;
