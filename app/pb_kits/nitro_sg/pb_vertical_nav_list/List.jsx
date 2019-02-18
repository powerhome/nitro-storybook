import React, { Component } from "react";
import PropTypes from "prop-types";
import Item from "./Item";
import Caption from "../pb_caption/_caption.jsx";

const propTypes = {
  children: PropTypes.element.isRequired
};

class List extends Component {
  static Item = Item;
  render() {
    return (
      <div className="vertical-nav-list">
        <div className="vertical-nav-list-title">
          <a>
            <Caption>{"Refactor this to show caption component later"}</Caption>
          </a>
        </div>
        <ul>{this.props.children}</ul>
      </div>
    );
  }
}

List.propTypes = propTypes;

export default List;
