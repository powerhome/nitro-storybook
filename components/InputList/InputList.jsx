import React from "react"
import { Button, InputGroup } from 'react-bootstrap'

import Icon from '../Icon/Icon'

import styles from "./InputList.scss"

const Add = ({ children, onAdd }) =>
  React.cloneElement(React.Children.only(children), { onClick: onAdd })

export default class InputList extends React.Component {
  static Add = Add

  render() {
    const { children, dropdownTemplate, onAdd, onRemove } = this.props

    const childrenInputGroups = React.Children.map(children, (child, i) => {
      if (child.type === Add) {
        return React.cloneElement(child, { onAdd })
      }

      const addon = dropdownTemplate && dropdownTemplate(i) || (
        <Button>
          <Icon name="trash-o" onClick={() => onRemove(i)} />
        </Button>
      )

      return (
        <InputGroup>
          <InputGroup.Addon>{addon}</InputGroup.Addon>
          {child}
        </InputGroup>
      )
    })

    return (
      <div className={styles.InputList}>
        {childrenInputGroups}
      </div>
    )
  }
}