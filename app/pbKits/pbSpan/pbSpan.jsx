import React from "react";

class pbSpan extends React.Component {
  render() {
    return(
      <span className={this.props.componentclass}>
          <span>{this.props.text}</span>
      </span>
    )
  }
}

export default pbSpan;
