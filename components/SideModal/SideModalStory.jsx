import React from "react"
import classnames from 'classnames'
import {select,boolean} from "@storybook/addon-knobs"
import { Modal } from "react-bootstrap"


export default function SideModalStory(stories) {
  stories.add("SideModal",
    () => {

      let props = {

        side: select("side",['left','right'], 'left'),
        sizeOption: select("sizeOption",['xxs','xs','sm','md','lg','xl','full','600','1000'],'xs'),
        collapseSize: select("collapseSize",['xs','sm','md','lg'],'xs'),
        show: boolean("show", false)
      }

      const css =[
        [`${side}Modal`],
        [`${side}Modal-${sizeOption}`],
        [`${side}Modal-collapse-${collapseSize}`],
      ]
      return   <Modal displayClassName={classnames(css)} show />

    }
  )
}
