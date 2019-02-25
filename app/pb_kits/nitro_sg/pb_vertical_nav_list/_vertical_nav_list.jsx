import React, { Component } from "react";
import PropTypes from "prop-types";
import VerticalNavListItem from "./_vertical_nav_list_item";
import Caption from "../pb_caption/_caption.jsx";

const propTypes = {
  children: PropTypes.oneOfType([
        PropTypes.arrayOf(PropTypes.node),
        PropTypes.node
    ])
};

class VerticalNavList extends Component {
  static VerticalNavListItem = VerticalNavListItem;
  render() {
    return (
      <div className="vertical_nav_list">
        <div className="vertical_nav_list_title">
          <a>
            <Caption>{'caption menu cool'}</Caption>
          </a>
        </div>
        <ul>{this.props.children}</ul>
      </div>
    );
  }
}

VerticalNavList.propTypes = propTypes;

export default VerticalNavList;
