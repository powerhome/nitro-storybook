/* @flow */

import React,{Component} from 'react'
import {Modal} from 'react-bootstrap'


type Props = {
  backdrop:boolean,
  show:boolean,
  className:string,
  side: string,
  bsClass:string,
  children?:Array<React.Node>
}

export default class SideModal extends Component {

  static defaultProps = {
    side:'left',
    show:'true',

    }

  props: Props

  render() {

    const {
      side,
      show,
      children
    } = this.props

    return (
      <div>
        <Modal
            backdrop
            className={side+"Modal"}
            show={show}
        >
          {children}
        </Modal>
      </div>
      )
  }
}
