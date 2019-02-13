import React from "react";

class Button extends React.Component {
  render() {
    return (
      <div className={this.props.wrapperclass}>
          <button className={this.props.componentclass}>
              <span>{this.props.text}</span>
          </button>
      </div>
    )
  }
}

export default Button;
