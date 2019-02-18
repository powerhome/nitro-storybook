import React, { Component } from "react";
import PropTypes from "prop-types";

const propTypes = {
  text: PropTypes.string.isRequired,
  link: PropTypes.string,
  active: PropTypes.bool
};

const defaultProps = {
  text: "Hello Item",
  link: "#",
  active: false
};

class Item extends Component {
  render() {
    const { text, link, active } = this.props;
    return (
      <li className={"vertical-nav-list-border-item" + active}>
        <a className="vertical-nav-list-item-link"
            href={link}
        >
          <span className="vertical-nav-list-item-link-text">{text}</span>
        </a>
      </li>
    );
  }
}

Item.propTypes = propTypes;
Item.defaultProps = defaultProps;

export default Item;
