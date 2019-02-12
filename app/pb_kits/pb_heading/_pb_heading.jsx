import React, {Component} from "react";
import PropTypes from 'prop-types'


const propTypes = {
  text: PropTypes.string.isRequired,
  tag: PropTypes.string.isRequired,
  size: PropTypes.oneOf([1, 2, 3, 4]).isRequired,
  className: PropTypes.string,
  dark: PropTypes.bool
};

const defaultProps = {
  text: 'Hello World',
  tag: 'h1',
  size: 1,
  dark: false 
};

class pb_heading extends Component {
  render() {
    const {size, dark, text } = this.props;
    return (
      <div className={`heading-${size}` + (dark === true ? '-dark' : '')}>{text}</div>
    )
  }
}

pb_heading.propTypes = propTypes;
pb_heading.defaultProps = defaultProps;

export default pb_heading;