import React, { Component } from "react";
import PropTypes from "prop-types";
import Item from "./Item";



const propTypes = {
  children: PropTypes.element.isRequired
};


class List extends Component {
  static Item = Item;
  render() {
    return (
      <ul >
        {this.props.children}
      </ul>
    );
  }
}

List.propTypes = propTypes;

export default List;
