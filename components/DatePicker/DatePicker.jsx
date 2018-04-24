import React from 'react'
import classnames from 'classnames'
import FontAwesome from 'react-fontawesome'
import {
  FormControl,
  InputGroup,
} from 'react-bootstrap'

import moment from 'moment'
require('moment-timezone')

import Datetime from 'react-datetime'

type Props = {
  className: string,
  defaultValue: string,
  inputProps: Object<{
    type: "text"
  }>,
  labelInside: boolean,
  labelText: string,
  multiInput: boolean,
  onChange: () => mixed,
  dateFormat: string,
  timeFormat: string,
  closeOnSelect: boolean,
  timeZone: string,
  required: boolean,
}

export default class DatePicker extends React.Component<Props> {

  static defaultProps = {
    className: "",
    inputProps: {
      type: "text",
    },
    onChange: function(){},
    labelInside: true,
    multiInput: false,
    dateFormat: "MM/DD/YYYY",
    closeOnSelect: true,
    timeZone: null,
  }

  state = {
    open: false,
    valid: true,
  }

  componentWillMount() {
    const defaultValue = moment(this.props.defaultValue)
    if(defaultValue.isValid()) this.handleOnChange(defaultValue)
  }

  props: Props

  handleOnChange = (dateTime) => {
    const {timeFormat} = this.props
    if(dateTime.format && dateTime.isValid()) {
      this.setState({valid: true})
      const dt = this.props.timeZone ? moment.tz(dateTime) : dateTime
      this.props.onChange(dt.format(timeFormat && timeFormat !== "" ? "YYYY-MM-DDTHH:mm:00Z" : "YYYY-MM-DD"))
    } else {
      this.setState({valid: false})
      this.props.onChange("")
    }
  }

  renderInput = (props, openCalendar) => {
    return (
      <InputGroup>
        <FormControl {...props}/>
        <span
            className="input-group-addon"
            onClick={openCalendar}
        >
          <FontAwesome name="calendar"/>
        </span>
      </InputGroup>
    )
  }

  render() {
    let {
      className,
      defaultValue,
      labelInside,
      labelText,
      dateFormat,
      timeFormat,
      closeOnSelect,
      timeZone,
      required,
    } = this.props

    const wrapperCSS = [
      className,
      labelInside ? "label-inside" : null,
    ]

    let inputProps = this.props.inputProps
    if(required) inputProps.required = "required"

    if(defaultValue) defaultValue = moment(defaultValue).format(dateFormat)

    return (
      <div className={classnames(wrapperCSS)}>
        <If condition={labelText}>
          <label>
            <If condition={required}>{`* `}</If>
            {labelText}
          </label>
        </If>
        <Datetime
            className={classnames("react-datetime", this.state.valid ? "" : "has-error")}
            closeOnSelect={closeOnSelect}
            dateFormat={dateFormat}
            defaultValue={defaultValue}
            inputProps={inputProps}
            onChange={this.handleOnChange}
            renderInput={this.renderInput}
            timeFormat={timeFormat}
            timeZone={timeZone}
        />
      </div>
    )
  }
}
