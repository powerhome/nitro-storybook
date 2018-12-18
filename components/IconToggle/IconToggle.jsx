/* @flow */

import React from 'react'
import styles from './styles.scss'
import Icon from '../Icon/Icon'
import classnames from 'classnames'

type Props = {
    children?: Array<React.Node>,
    className?: string,
    iconOption1?:string,
    iconOption2?:string,
    size:string,
    color:string,
    active:boolean,
    onToggle: () => mixed,


}

export default class IconToggle extends React.Component<Props> {

  static defaultProps = {
    color: "text-sky",
    className: "",
    iconOption1:"minus-circle",
    iconOption2:"plus-circle",
    size:"text-larger",
    onToggle: () => {},
  }

  props: Props

  handleToggle = () => {
    this.props.onToggle(!this.props.active)

  }

  render() {
    const{
      className,
      iconOption1,
      iconOption2,
      color,
      size,


    } = this.props

    const css =[
      styles[`icon-toggle`]
    ]
    return (
      <div>
          <div className={classnames(css),size}
              onClick={this.handleToggle}
          >
          <label>
          <input className=""
              type="checkbox"
          />
         <Icon className={`${className,color}`}
             name={iconOption1}
             title={`icon-1`}
         />
          <Icon className={`ml-4 ${className,color}`}
              name={iconOption2}
              title={`icon-2`}
          />
        </label>
      </div>
    </div>
   )
  }
}
