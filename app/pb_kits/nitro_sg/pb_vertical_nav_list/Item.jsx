import React, { Component } from "react";
import PropTypes from "prop-types";


const propTypes = {
  text: PropTypes.string.isRequired,
};

const defaultProps = {
  text: "Hello Item",
};

class Item extends Component {
  render() {
    const { text } = this.props;
    return (
      <li>
        {text}
      </li>
    );
  }
}

Item.propTypes = propTypes;
Item.defaultProps = defaultProps;

export default Item;
