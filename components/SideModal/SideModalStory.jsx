import React from "react"
import SideModal from "./SideModal"
import {select,boolean} from "@storybook/addon-knobs"


export default function SideModalStory(stories) {
  stories.add("SideModal",
    () => {
      let props = {
        side: select("side",['left','right'], 'left'),
        show: boolean("show", true),
        sizeOption: select("sizeOption",['xxs','xs','sm','md','lg','xl','full','600','1000'],'xs'),
        collapseSize: select("collapseSize",['xs','sm','md','lg'],'xs')
      }

      return (
        <div>
        <SideModal {...props} />
        </div>
      )
    }
  )
}
