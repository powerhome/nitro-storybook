import React from "react";

class pbButton extends React.Component {
  render() {
    return (
      <div className="{this.props.wrapperclass}">
          <button className="{this.props.componentclass}">
              <span>{this.props.text}</span>
          </button>
      </div>
    )
  }
}

export default pbButton;
