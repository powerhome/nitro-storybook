import React from "react";

class Caption extends React.Component {
  render() {
    return (
      <p className="caption">{this.props.text}</p>
    )
  }
}

export default Caption;
