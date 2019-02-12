import React from 'react';

class pb_card extends React.Component {
  render() {
    return (
      <div className="pb-card">
        <h1>
           I am pb_card-React, {this.props.name}
        </h1>
        <div className="pb-card-body">
          { this.props.children }
        </div>
      </div>
    )
  }
}

export default pb_card;
