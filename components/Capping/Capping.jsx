/* @flow */
import styles from './styles.scss'
import React from 'react'
import classnames from 'classnames'

type Props = {
  cap: "top" | "bottom" | "left" | "right"| null,
  className:string,
  children ?: Array<React.Node>,

}

export default class Capping extends React.Component<Props> {
  static defaultProps = {

  }
  props: Props
  render() {

    const {
      children,
      className,
      cap,
    } = this.props

    const css = [
      className,
      styles.cap,
      styles[`cap-${cap}`],
    ]
     return (
     <div>
       <button className={classnames(css)}>{children}</button>
     </div>
   )
  }
}
