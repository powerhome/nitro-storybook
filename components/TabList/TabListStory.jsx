import React from "react"
import Tab from "../Tab/Tab"
import TabList from "./TabList"

export default function TabListStory(stories) {
  stories.add("Tabbed List",
    () => {
      return (
        <div className="container my-5">
          <TabList>
            <Tab
                active
                text="Normal Tab"
            />
            <Tab
                active={false}
                href="https://www.github.com"
                target="_blank"
                text="GitHub"
            />
            <Tab
                active={false}
                onClick={function(){alert("Hey, who clicked me?!")}}
                text="Click Tab"
            />
          </TabList>
        </div>
      )
    }
  )
}
