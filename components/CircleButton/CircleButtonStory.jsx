import React from "react"
import { Button } from "react-bootstrap"
import Icon from "../Icon/Icon.jsx"
import { text, select,} from "@storybook/addon-knobs"
import classnames from "classnames"


export default function CircleButton(stories) {
  stories.add("CircleButton",
    () => {
      const props = {
        className: text("className", ""),
        size: select("sizeOption",['md','lg',],'md'),
        iconColor:select("iconColor",["text-power-red","text-power-blue","text-white"],"text-power-red"),
        iconName: text("name", "plus"),
        btnColor:text("btnColor","bg-white"),
      }



      const iconName = props.name
      const iconColor = props.iconColor
      const size = `circleButton-`+ props.size
      const btnColor= props.btnColor




      return (
        <Button className={classnames(size,btnColor)}>
          <Icon className={classnames(iconColor)}
              name={iconName}
          />
      </Button>
      )
    }
  )
}
