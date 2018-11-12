/* @flow */

import React,{ Component } from 'react'
import {Modal} from 'react-bootstrap'
import classnames from 'classnames'


type Props = {
  backdrop:boolean,
  show:boolean,
  className:string,
  side: string,
  bsClass:string,
  children?:Array<React.Node>,
  sizeOption?:string,
  collapseSize?:string

}

export default class SideModal extends Component {

  static defaultProps = {
    side:'left',
    show:'true',
    sizeOption:'xs',
    collapseSize:'xs',
  }

  props: Props

  render() {
    const {
      side,
      show,
      sizeOption,
      collapseSize,
      children,
      ...props
    } = this.props

    const css =[
      [`${side}Modal`],
      [`${side}Modal-${sizeOption}`],
      [`${side}Modal-collapse-${collapseSize}`],
    ]
    return (
        <Modal
            backdrop
            className={classnames(css)}
            show={show}
            {...props}
        >
          {children}
        </Modal>
      )
  }
}
