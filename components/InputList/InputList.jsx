import React from "react"
import { Button, InputGroup } from 'react-bootstrap'

import Icon from '../Icon/Icon'

import styles from "./InputList.scss"

const Add = ({ children, onAdd }) => {
  children = children || (
    <Button bsStyle="primary">{"Add"}</Button>
  )

  return (
    React.cloneElement(React.Children.only(children), { onClick: onAdd })
  )
}

Add.displayName = "InputList.Add"

class Uncontrolled extends React.Component {
  static displayName = "InputList.Uncontrolled"
  static defaultProps = {
    onChange: () => {},
  }

  state = {
    items: [...this.props.value],
  }

  handleAdd = () => this.setState({
    items: [
      ...this.state.items,
      { tmpId: Math.random() },
    ]
  }, () => this.props.onChange(this.state))

  handleRemove = (index) => this.setState({
    items: [
      ...this.state.items.slice(0, index),
      ...this.state.items.slice(index + 1),
    ]
  }, () => this.props.onChange(this.state))

  handleChange = (index) => (event) => {
    const updatedItem = { ...this.state.items[index] }
    updatedItem[event.target.name] = event.target.value

    this.setState({
      items: [
        ...this.state.items.slice(0, index),
        updatedItem,
        ...this.state.items.slice(index + 1),
      ]
    }, () => this.props.onChange(this.state))
  }

  render() {
    const ChildComponent = React.Children.only(this.props.children).type

    return (
      <InputList
          onAdd={this.handleAdd}
          onRemove={this.handleRemove}
          dropdownTemplate={this.props.dropdownTemplate}
      >
        <InputList.Add><Button bsStyle="primary">{this.props.addLabel}</Button></InputList.Add>

        {this.state.items.map((item, i) => (
          <ChildComponent key={item.tmpId || item.id || i} {...item} onChange={this.handleChange(i)} />
        ))}

        <InputList.Add><Button bsStyle="primary">{this.props.addLabel}</Button></InputList.Add>
      </InputList>
    )
  }
}

export default class InputList extends React.Component {
  static Add = Add
  static Uncontrolled = Uncontrolled
  static defaultProps = {
    onAdd: () => {},
    onRemove: () => {},
  }

  render() {
    const { children, dropdownTemplate, onAdd, onRemove } = this.props

    let nonInputChildrenCount = 0

    const childrenInputGroups = React.Children.map(children, (child, i) => {
      i -= nonInputChildrenCount

      if (child.type === Add) {
        nonInputChildrenCount++
        return React.cloneElement(child, { onAdd })
      }

      const addon = dropdownTemplate && dropdownTemplate(i, onAdd, onRemove) || (
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