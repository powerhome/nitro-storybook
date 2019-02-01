import React from "react";

class pbDiv extends React.Component {
  render() {
    return (
      <div className={this.props.wrapperclass}>
          <div className={this.props.componentclass}>
              <span>{this.props.text}</span>
          </div>
      </div>
    )
  }
}

export default pbDiv;
