import React from "react"
import { Button, DropdownButton, MenuItem } from "react-bootstrap"

import { text, select, boolean } from "@storybook/addon-knobs"

import Icon from '../Icon/Icon'
import InputList from "./InputList"
import styles from "./Story.scss"

const PhoneInput = ({ number = "", numberType = "", onChange }) => (
  <div className="multi-input-group full">
    <input name="number" className="multi-input-group-item p-2" placeholder="(999) 999-9999" onChange={onChange} value={number} />
    <select name="numberType" className="multi-input-group-item auto p-2" onChange={onChange} value={numberType}>
      <option />
      <option value="Cell">{'Cell'}</option>
      <option value="Home">{'Home'}</option>
    </select>
  </div>
)

const EmailInput = ({ address = "", onChange }) => (
  <div className="multi-input-group full">
    <input type="email" name="address" className="multi-input-group-item p-2" placeholder="email@example.com" onChange={onChange} value={address} />
  </div>
)

const dropdownTemplate = (iconName) => (index, onAdd, onRemove) => {
  const dropdownIcon = (
    <span>
      <Icon name={iconName} />
      <span>{' '}</span>
      <Icon name="angle-down" />
    </span>
  )

  return (
    <DropdownButton id="dropdown" noCaret title={dropdownIcon} className={styles.DropdownButton}>
      <MenuItem onClick={() => onAdd()}>{'Add'}</MenuItem>
      <MenuItem onClick={() => onRemove(index)}>{'Remove'}</MenuItem>
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
          <InputList.Add />
          <PhoneInput />
          <PhoneInput />
          <InputList.Add />
        </InputList>
      </div>
    )
  })

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
  })

  stories.add("InputList.Uncontrolled", () => {
    return (
      <div className={styles.InputListUncontrolled}>
        <InputList.Uncontrolled
            addLabel="Add New Phone"
            dropdownTemplate={dropdownTemplate("volume-control-phone")}
            onChange={(phones) => console.log("List changed:", phones)}
            value={[{ number: "1231231234", numberType: "Cell" }, { number: "3213213214", numberType: "Home" }]}
        >
          <PhoneInput />
        </InputList.Uncontrolled>

        <InputList.Uncontrolled
            addLabel="Add New Email"
            onChange={(email) => console.log("List changed:", email)}
            value={[{ address: "drborges@email.com" }, { address: "diego.borges@powerhrg.com" }, { address: "diego@powerhrg.com" }]}
        >
          <EmailInput />
        </InputList.Uncontrolled>
      </div>
    )
  })
}