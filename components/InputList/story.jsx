import React from "react"
import InputList from "./"

import { text, boolean } from "@storybook/addon-knobs"

const IncomeSourceInput = ({ value, onChange, onRemove }) => (
  <div>
    <input type="checkbox" name="default" value={value.default} onChange={onChange} />
    <input name="source" value={value.source} onChange={onChange} />
    <input name="income" value={value.income} onChange={onChange} />
    <button type="button" onClick={onRemove}>{"Remove"}</button>
  </div>
);

export default function InputListStory(stories) {
  stories.add("InputList", () => {
    const incomeSources = [
      { id: 1, source: "Power", income: 50000 },
      { id: 2, source: "Retirement Funds", income: 30000 },
    ]

    return (
      <InputList value={incomeSources} onChange={(value) => console.log(value)}>
        <InputList.Add>
          <button type="button">{"Add"}</button>
        </InputList.Add>

        <InputList.Input>
          <IncomeSourceInput />
        </InputList.Input>
      </InputList>
    )
  })
}