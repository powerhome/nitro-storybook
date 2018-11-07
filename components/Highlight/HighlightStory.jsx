import React from "react"
import Highlight from "./Highlight"

import { select } from "@storybook/addon-knobs"

export default function HighlightStory(stories) {
  stories.add("Highlight",
    () => {
      let props = {
        side: select("side",['left','right','top','bottom'], 'left'),
        color: select('color',['power-navy','power-red','power-blue','power-gold','power-green','power-navy-darker','power-royal'],'power-blue'),
      }
      return (

          <div>
              <Highlight {...props}/>
          </div>

      )
    }
  )
}
