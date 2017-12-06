import React from "react"
import { Button, DropdownButton, MenuItem } from "react-bootstrap"

import { text, select, boolean } from "@storybook/addon-knobs"

import Icon from '../Icon/Icon'
import InputList from "./InputList"
import styles from "./Story.scss"

const PhoneInput = ({}) => (
  <div className="multi-input-group full">
    <input className="multi-input-group-item p-2" placeholder="(999) 999-9999" />
    <select className="multi-input-group-item auto p-2">
      <option />
      <option value="1">{'Cell'}</option>
      <option value="1">{'Work'}</option>
    </select>
  </div>
)

const EmailInput = ({}) => (
  <div className="multi-input-group full">
    <input type="email" className="multi-input-group-item p-2" placeholder="example@email.com" />
  </div>
)

const dropdownTemplate = ({ iconName }) => (index) => {
  const dropdownIcon = (
    <span>
      <Icon name={iconName} />
      <Icon name="angle-down" />
    </span>
  )

  return (
    <DropdownButton id="dropdown" noCaret title={dropdownIcon} className={styles.DropdownButton}>
      <MenuItem onClick={() => console.log("Removing input", index)}>{'Remove'}</MenuItem>
      <MenuItem onClick={() => console.log("Creating new resident for input", index)}>{'Create New Resident'}</MenuItem>
      <MenuItem onClick={() => console.log("Moving input", index, "to 2nd Resident")}>{'Move to 2nd Resident'}</MenuItem>
    </DropdownButton>
  )
}

export default function Story(stories) {
  stories.add("InputList/Default", () => {
      return (
        <div style={{ width: 300 }}>
          <InputList
              onAdd={() => console.log("Adding new phone")}
              onRemove={(index) => console.log("Removed", index)}
          >
            <InputList.Add><Button bsStyle="primary">{'Add New Phone'}</Button></InputList.Add>
            <PhoneInput />
            <PhoneInput />
            <InputList.Add><Button bsStyle="primary">{'Add New Phone'}</Button></InputList.Add>
          </InputList>
        </div>
      )
    }
  )

  stories.add("InputList/With Dropdown Menu", () => {
      return (
        <div style={{ width: 300 }}>
          <InputList
              onAdd={() => console.log("Adding new phone")}
              onRemove={(index) => console.log("Removed", index)}
              dropdownTemplate={dropdownTemplate("volume-control-phone")}
          >
            <InputList.Add><Button bsStyle="primary">{'Add New Phone'}</Button></InputList.Add>
            <PhoneInput />
            <PhoneInput />
            <InputList.Add><Button bsStyle="primary">{'Add New Phone'}</Button></InputList.Add>
          </InputList>
        </div>
      )
    }
  )
}
