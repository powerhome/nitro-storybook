import React from 'react'
import classnames from 'classnames'
import FontAwesome from 'react-fontawesome'
import {
  FormControl,
} from 'react-bootstrap'

import moment from 'moment'
require('moment-timezone')

import Datetime from 'react-datetime'

export type Props = {
  className: string,
  defaultValue: string,
  errorClass?: string,
  inputProps: Object<{
    type: "text"
  }>,
  isValidDate: () => boolean,
  labelInside: boolean,
  labelText: string,
  multiInput: boolean,
  onChange: (any) => void,
  dateFormat: string,
  timeFormat: string,
  closeOnSelect: boolean,
  timeZone: string,
  required: boolean,
  value: string,
};

export default class DatePicker extends React.Component<Props> {

  static defaultProps = {
    className: "",
    errorClass: "has-error",
    inputProps: {
      type: "text",
    },
    onChange: function() {},
    labelInside: true,
    multiInput: false,
    dateFormat: "MM/DD/YYYY",
    closeOnSelect: true,
    timeZone: null,
  }

  state = {
    valid: true,
  }

  props: Props

  componentWillMount() {
    this.props.onChange(this.defaultValue())
  }

  fieldFormat = () => {
    const { timeFormat, dateFormat } = this.props
    return timeFormat && timeFormat !== "" ? "YYYY-MM-DDTHH:mm:00Z" : dateFormat
  }

  handleOnChange = (dateTime) => {
    const { timeZone, onChange } = this.props

    if(dateTime.isValid()) {
      this.setState({ valid: true })
      const date = timeZone ? moment.tz(dateTime) : dateTime
      onChange(date.format(this.fieldFormat()))
    } else {
      this.setState({ valid: false })
      onChange("")
    }
  }

  renderInput = (inputProps, openCalendar) => {
    const {
      labelText,
      required,
      labelInside,
    } = this.props

    const wrapperClass = classnames(
      "d-flex",
      "input-group",
      { "label-inside": labelInside },
    )

    return (
      <div className={wrapperClass}>
        <If condition={labelText}>
          <label>
            <If condition={required}>{`* `}</If>
            {labelText}
          </label>
        </If>
        <FormControl {...inputProps}/>
        <span
            className="input-group-addon"
            onClick={openCalendar}
        >
          <FontAwesome name="calendar"/>
        </span>
      </div>
    )
  }

  dateTimeProps = () => {
    let {
      className,
      dateFormat,
      errorClass,
      timeFormat,
      closeOnSelect,
      timeZone,
      required,
      multiInput,
      ...props
    } = this.props

    const inputProps = this.props.inputProps
    if (required) inputProps.required = "required"

    return {
      className: classnames(
        className,
        "react-datetime",
        {
          [errorClass]: !this.state.valid,
          "multi-input-group-item": multiInput,
        },
      ),
      closeOnSelect,
      dateFormat,
      inputProps,
      onChange: this.handleOnChange,
      renderInput: this.renderInput,
      timeFormat,
      timeZone,
      value: this.defaultValue(),
      ...props,
    }
  }

  defaultValue = () => {
    const { value, defaultValue } = this.props
    if (!value && defaultValue == '') {
      return ''
    }
    return moment(value || defaultValue).format(this.fieldFormat())
  }

  render() {
    return (
      <Datetime {...this.dateTimeProps()}/>
    )
  }
}
