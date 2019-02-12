import React from "react";

class pb_button extends React.Component {
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

export default pb_button;
