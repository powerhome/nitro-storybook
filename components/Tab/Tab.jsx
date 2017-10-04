/* @flow */

import React, { Component } from 'react'
import classnames from 'classnames'

import Icon from '../Icon'

type Props = {
  active: boolean,
  href?: string,
  icon?: string, //fa- icon
  onClick?: () => mixed,
  text: string,
}

import styles from './tab.scss'

export default class Tab extends Component<Props> {
  props: Props

  renderIcon() {
    const { icon } = this.props
    if (icon) return (<Icon name={icon} />)
    return null
  }

  render() {
    const {
      active,
      href,
      onClick,
      text,
    } = this.props

    return (
      <Choose>
        <When condition={href}>
          <a
              className={classnames(styles.tabAnchor, active ? styles.tabActive : null)}
              href={href}
          >
            { this.renderIcon() }
            {text}
          </a>
        </When>
        <When condition={!href}>
          <div
              className={classnames(styles.tab, active ? styles.tabActive : null)}
              onClick={onClick}
          >
            { this.renderIcon() }
            {text}
          </div>
        </When>
      </Choose>
    )
  }
}