import React from 'react'


type Props = {
  //<!-- List props and their type here -->
}

class List extends React.Component<Props> {
  static defaultProps = {
    //<!-- List prop default values here -->
  }
  props: Props
  render() {

    const {
      //<!-- List props here -->
    } = this.props

    return (<!-- Build component here -->)
  }
}

export default List;
