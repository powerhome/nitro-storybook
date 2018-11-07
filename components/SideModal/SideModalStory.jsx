import React from "react"
import SideModal from "./SideModal"
import {select,boolean} from "@storybook/addon-knobs"


export default function SideModalStory(stories) {
  stories.add("SideModal",
    () => {
      let props = {
        side: select("side",['left','right'], 'left'),
        show: boolean("show", true),
      }

      return (
        <div>
        <SideModal {...props} />
        </div>
      )
    }
  )
}
