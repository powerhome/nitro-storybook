import React from "react"
import PropTypes from "prop-types"
import { validationStateMapping } from "./helpers"

export default class Validate extends React.PureComponent {
  static contextTypes = {
    onInputValid: PropTypes.func,
    onInputInvalid: PropTypes.func,
    registerWithGroup: PropTypes.func,
    registerWithForm: PropTypes.func,
  }

  static defaultProps = {
    propagate: false,
    trigger: "onChange",
  }

  state = {
    valid: undefined
  }

  componentWillMount() {
    this.context.registerWithGroup && this.context.registerWithGroup()
  }

  render() {
    const { children, trigger, propagate } = this.props
    const child = React.Children.only(children)

    return React.cloneElement(child, {
      className: `validation-${validationStateMapping[this.state.valid]}`,
      valid: propagate ? this.state.valid : undefined,
      onInvalid: e => {
        const input = e.target

        child.props.onInvalid && child.props.onInvalid(e)
        this.setState({ valid: false }, () => this.context.onInputInvalid && this.context.onInputInvalid(input))
      },
      [trigger]: e => {
        const input = e.target

        if (typeof child.props[trigger] === "function") {
          child.props[trigger](e)
        }

        if (input.checkValidity()) {
          this.setState({ valid: true }, () => this.context.onInputValid && this.context.onInputValid(input))
        } else {
          this.setState({ valid: false }, () => this.context.onInputInvalid && this.context.onInputInvalid(input))
        }
      }
    })
  }
}
