import React from "react";

class pbHeading extends React.Component {
  render() {
    return(
      <span className={this.props.componentclass}>
          <span>{this.props.text}</span>
      </span>
    )
  }
}

export default pbHeading;
