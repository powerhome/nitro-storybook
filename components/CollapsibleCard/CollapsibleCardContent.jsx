import React from 'react'
import classnames from 'classnames'
import AnimateHeight from 'react-animate-height'


export type CollapsibleCardContentProps = {
  children: string | React.Node | Array<React.Node>,
}

export default class CollapsibleCardContent extends React.Component<Props> {
  static defaultProps = {
    children: null,
  }
  props: Props

  constructor() {
    super()
  }


  render() {
    const {
      children,
      className,
    } = this.props
    const css = classnames([
      "collapsible-card-content",
      className
    ])
    return (
      // <div className={css} style={this.props.isExpanded ? {display: 'block'} : null}>
      //     {this.props.children}
      // </div>
      <AnimateHeight
        duration={ 500 }
        height={ height }
      >
      { children }
      </AnimateHeight>
    )
  }
}
