import React from "react";

class Body extends React.Component {
  render() {
    return (
      <p className="body">{this.props.text}</p>
    )
  }
}

export default Body;
