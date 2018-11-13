import React from "react"
import { text, select} from "@storybook/addon-knobs"
import Button from "../Button/Button"

export default function CappingStory(stories) {
  stories.add("Capping",
    () => {
      let props = {
        className: text("className", "btn-primary"),
        cap: select("cap",["left", "right", "top", "bottom","none"],"left"),
      }
      return <Button {...props} />


    }
  )
}
