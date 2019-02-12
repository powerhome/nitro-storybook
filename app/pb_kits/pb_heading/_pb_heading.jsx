import React, {Component} from "react";
import PropTypes from 'prop-types'


const propTypes = {
  text: PropTypes.string.isRequired,
  tag: PropTypes.string.isRequired,
  size: PropTypes.number.isRequired,
  className: PropTypes.string.isRequired
};

const defaultProps = {
  text: 'Hello World',
  tag: 'h1',
  size: 1
};


class Heading extends Component {
  render() {
    return (
      <div className={this.props.className}>{this.props.text}</div>
    )
  }
}

Heading.propTypes = propTypes;
Heading.defaultProps = defaultProps;

export default Heading;