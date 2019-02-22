import React, { Component } from "react";
import PropTypes from "prop-types";


const propTypes = {
  url: PropTypes.string.isRequired
};

const defaultProps = {
  url: ''
};

@lazyload({
  height: 200,
  once: true,
  offset: 100
})
class Image extends Component {
  render() {
    const { url } = this.props;
    return (  
        <div>
          <img src={url} alt="test"/>
        </div>
    );
  }
}

Image.propTypes = propTypes;
Image.defaultProps = defaultProps;

export default Image;
