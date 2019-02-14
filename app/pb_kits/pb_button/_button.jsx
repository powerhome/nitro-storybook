import React, { Component } from "react";
import PropTypes from "prop-types";

const propTypes = {
  text: PropTypes.string.isRequired,
  type: PropTypes.oneOf(["primary", "danger", "dashed"]),
  size: PropTypes.oneOf(["large", "small"]),
  dark: PropTypes.bool,
  wrapperclass: PropTypes.string,
  componentclass: PropTypes.string
};

const defaultProps = {
  text: "Hello World",
  type: "",
  size: "",
  dark: false,
  wrapperclass: 'kit-btn-wrapper',
  componentclass: ''

};

class Button extends Component {
  render() {
    const { text, type, size, dark, wrapperclass, componentclass} = this.props;
    
    return (
      <div className={wrapperclass}>
        <button className={'kit-btn' + (type !== "" ? `-${type}` : "" ) + (size !== "" ? `-${size}` : "" ) + (dark === true ? "-dark" : "") + (componentclass !== "" ? `${componentclass}` : ""  )}>
            <span>{text}</span>
        </button>
      </div>
    );
  }
}

Button.propTypes = propTypes;
Button.defaultProps = defaultProps;

export default Button;
