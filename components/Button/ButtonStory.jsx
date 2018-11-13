import React from "react"
import Button from "./Button"

import { text, select } from "@storybook/addon-knobs"

export default function ButtonStory(stories) {
  stories.add("Solid Buttons",
    () => {
      let props = {
        className: text("className", "btn-default"),
        text: text("text", "Click Me"),
        type: select("type", ["anchor", "button", "submit", ""], "button"),
        cap: select("cap",["left", "right", "top", "bottom","none"],"none"),
      }
      return (
        <div className="container my-5">
          <div className="row">
            <div className="col-sm-2">
              <Button {...props}/>
            </div>
            <div className="col-sm-2">
              <Button className="btn-primary" text="Power Royal" type="button" />
            </div>
            <div className="col-sm-2">
              <Button className="btn-success" text="Power Green" type="button" />
            </div>
            <div className="col-sm-2">
              <Button className="btn-danger" text="Power Red" type="button" />
            </div>
            <div className="col-sm-2">
              <Button className="btn-link" text="Link Button" type="button" />
            </div>
          </div>
        </div>
      )
    }
  )

  stories.add("Ghost Buttons",
    () => {
      const props = {
        className: text("className", "btn-ghost-power-royal"),
        text: text("text", "Power Royal"),
        type: select("type", ["anchor", "button", "submit", ""], "button"),
        cap: select("cap",["left", "right", "top", "bottom","none"],"none"),
      }

      return (
        <div className="row">
          <div className="col-sm-2">
            <Button {...props}/>
          </div>
          <div className="col-sm-2">
            <Button className="btn-ghost-power-green" text="Power Green" type="button" />
          </div>
          <div className="col-sm-2">
            <Button className="btn-ghost-power-red" text="Power Red" type="button" />
          </div>
        </div>
      )
    }
  )
}
