import React, {Component} from "react";
import PropTypes from 'prop-types'


const propTypes = {
  text: PropTypes.string.isRequired,
  tag: PropTypes.string.isRequired,
  size: PropTypes.oneOf([1, 2, 3, 4]),
  className: PropTypes.string,
  theme: PropTypes.string
};

const defaultProps = {
  text: 'Hello World',
  size: 1,
  theme: "dark"
};

class Heading extends Component {
  render() {
    return (
      <div className={`heading-${size}-${theme}`}>{this.props.text}</div>
    )
  }
}

Heading.propTypes = propTypes;
Heading.defaultProps = defaultProps;

export default Heading;