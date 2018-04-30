/* @flow */

import React from 'react'
// import styles from './styles.scss'
import { forEach } from 'lodash'

type Props = {|
  className?: string,
  defaultValue?: string,
  mask: 'ssn' | 'phone' | 'phone-intl',
  maxLength: number,
  type: 'text',
|}

export default class MaskedInput extends React.Component<Props> {
  static defaultProps = {
    className: 'form-control',
  }

  state = {
    maskedValue: null,
    value: null,
  }

  componentWillMount() {
    const {defaultValue} = this.props
    this.setState({
      maskedValue: this.getMaskedValue(defaultValue),
      value: defaultValue.replace(/\W/gi, "").substr(0, this.props.maxLength + 1),
    })
  }

  props: Props

  handleOnChange = (e) => {
    const value = e.target.value.replace(/\W/gi, "").substr(0, this.props.maxLength + 1)
    const maskedValue = this.getMaskedValue(value)
    this.setState({
      maskedValue,
      value,
    })
  }

  maskValue = (value, mask) => {
    const values = mask.split(/\W/gi), nonWords = mask.replace(/\w/gi, "")
    let outputVal = "", valPos = 0, nwPos = 0
    if(!value || value.length < 1 || value.length <= values.length) return value
    forEach(values, (val, x) => {
      forEach(val, () => {
        outputVal += value.charAt(valPos)
        ++ valPos
      })
      if(x < values.length - 1) {
        outputVal += nonWords.charAt(nwPos)
        ++ nwPos
      }
    })
    return outputVal
  }

  getMaskedValue = (value) => {
    let maskedValue

    switch(this.props.mask) {
      case 'ssn':
        maskedValue = '000-00-0000'
      break
      case 'phone':
        maskedValue = '(000)-000-0000'
      break
      case 'phone-intl':
        maskedValue = '+0 (000)-000-0000'
      break
      default: value
    }

    return this.maskValue(value, maskedValue)
  }

  render() {
    const {
      className,
      type,
    } = this.props

    const {
      maskedValue,
      value
    } = this.state

    return (
      <span>
        <input
            type="hidden"
            value={value}
        />
        <input
            className={className}
            onChange={this.handleOnChange}
            type={type}
            value={maskedValue}
        />
      </span>
    )
  }
}
