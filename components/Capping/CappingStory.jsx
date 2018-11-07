import React from "react"
import Capping from "./Capping"
import Button from "../Button/Button"
import { text, select} from "@storybook/addon-knobs"

export default function CappingStory(stories) {
  stories.add("Capping",
    () => {
      let props = {
        className: text("className", ""),
        cap: select("cap",["left", "right", "top", "bottom",["none" ,null]],"left")
      }
      return (
        <Capping {...props}>
          <Button />
        </Capping>
      )
    }
  )
}
