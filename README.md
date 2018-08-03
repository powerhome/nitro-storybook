# Nitro Storybook

This repo provides the tools to implement view components which make up the visual appearance of Nitro.

* Stylesheets for the app navigation and general appearance
* Self-contained React components for use in building views

The intent of this repo is to provide a base on which other UIs can be built such that they maintain visual consistency and the Nitro brand.


- [Quick Start](#quick-start)
- [Local Storybook Development in Nitro-Web](#local-storybook-development-in-nitro-web)
- [Other options for storybook in Nitro-Web](#other-options-for-storybook-in-nitro-web)
- [Getting Your Changes Into Nitro-Web](#getting-your-changes-into-nitro-web)
- [Creating Components](#creating-components)
- [Converting Existing Components](#converting-existing-components)


## Quick Start
From the current project directory, run:

1. ensure you are running proper node version (see `package.json` => `engines`)
2. `yarn install`
3. `yarn run storybook`
4. navigate to [localhost:9001](http://localhost:9001)

---

## Local Storybook Development in Nitro-Web
Its easy to create and test out a component on nitro in real time, even with hot reload. You can point your local storybook folder as you develop it.

##### Update the storybook in the Gemfile to a local path
`gem "nitro_sg", :path => "/path/to/storybook/locally"`

##### Update the storybook in package.json to a local path
`”nitro-storybook": "/path/to/storybook/locally"`

> if you have any problems with assets not showing try running:
`bundle exec rake assets:clobber`


---

## Other options for storybook in Nitro-Web
You’ll need to point to a something published on GitHub when your ready to deploy it. Here are some options for you:

##### Gemfile - Tag
`gem "nitro_sg", git: "git@github.com:powerhome/nitro-styleguide.git", tag: "v1.2.1"`

##### Gemfile - SHA
`gem "nitro_sg", git: "git@github.com:powerhome/nitro-styleguide.git", ref: "4aded"`

##### Gemfile - Branch
`gem "nitro_sg", git: "git@github.com:powerhome/nitro-styleguide.git", branch: "branchname"`

##### package.json - Branch
`"nitro-storybook": "git+ssh://git@github.com/powerhome/nitro-storybook.git#branchname",`


---

## Getting Your Changes Into Nitro-Web

### 1. Increase your version

Check the [releases](https://github.com/powerhome/nitro-storybook/releases) and increase your version by 1 in the following files:

```
lib/nitro_sg/version.rb
package.json
```

Be sure and run the following anytime you version up:

`yarn install && bundle install`


### 2. Prep a Storybook PR

Get your `nitro-storybook` PR approved and merged into the `nitro-storybook`'s `master` branch.

### 3. Create a Tag & Release

Once your merged you need to create a tag so we can reference this version. Here are some easy ways to create and delete tags:

##### Add A Tag
```
git tag v1.0.1
git push origin v1.0.1
```

##### Remove A Tag
```
git tag -d v1.0.1
git push --delete origin v1.0.1
```

### 4. Update references in Nitro Web

##### Package.json
`"nitro-storybook": "git+ssh://git@github.com/powerhome/nitro-storybook.git#v1.9.2",`

##### Gemfile (Usually 4 Spots)
```
gem "nitro_sg", git: "git@github.com:powerhome/nitro-storybook.git", tag: "v1.9.2"
```

If your updated styling doesn’t show up, you may have old assets you need to remove.
`bundle exec rake assets:clobber`

---

## Creating Components

Creation of new components requires a bit of forethought. Ask yourself these questions first:

1. Does the component already exist in `nitro_react` ?
    1. Yes - see [Converting Existing Components](#converting-existing-components)
    1. No - continue
1. Ensure you are familiar with these concepts:
    - using Flow.js (install tooling in your editor/IDE)
    - creating "dumb components" in React - your new component **will not** need to be concerned with XHR requests, servers, ect.
    - ESLint (install tooling in your editor/IDE)
    - CSSModules
    - Composing complex React components/organisms (so that you don't create them here!)
    - [Storybook]()

### New React Component

Here are the steps to creating a new `Foo` component (in order):

1. Create a new directory under `/components` named `Foo`
1. Create `Foo.jsx` inside the directory with the contents:
    ```javascript
    /* @flow */

    import React from 'react'

    type Props = {}

    export default class Foo extends React.Component<Props> {
      static defaultProps = {}
      props: Props
      render() {
        return <span>{`I'm a Foo`}</span>
      }
    }

    ```
1. Create `styles.scss` inside the directory with the contents:
    ```scss
    .foo {}
    ```
1. Add the stylesheet as an import by adding this line:
    ```javascript
    import styles from './styles.scss'
    ```
1. Then make use of the import by adding `styles.foo` as the `className`:
    ```javascript
    render() {
      return <span className={styles.foo}>{`I'm a Foo`}</span>
    }
    ```
1. Add `Foo.jsx` to the component index in `components/index.js`
    ```javascript
    export Foo from '../Foo/Foo.jsx'
    ```

#### Create the Story

1. Within the same directory, create a `FooStory.jsx` with the contents:
    ```javascript
    import React from "react"
    import Text from "./Foo"

    import { text, select, boolean } from "@storybook/addon-knobs"

    export default function TextStory(stories) {
      stories.add("Foo",
        () => {
          let props = {}
          return (
            <Foo {...props}/>
          )
        }
      )
    }
    ```
1. Add the story to the appropriate story index. This will depend on the intent of your component. `Foo` is pretty simply 😁, hence we will add it to `/stories/basic.js` like so:
    ```javascript
    export FooStory from '../components/Foo/FooStory'
    ```
    This will add your `Foo` story to the categoy "Basic Components" in Storybook

---

## Converting Existing Components

Conversion of existing components in `nitro_react` is a little different since we already have a decent class structure in the jsx component. There are, however, a few considerations:

- Use Flow.js types instead of `PropTypes`
- use `class` instead of `function` (see the examples below)
- Try and fix as many eslint and Flow warnings as possible - this is your chance and the time is now! 😬 💀

1. Create a `Props` flow type
    ```javascript
    type Props = {
      children?: Array<React.Node>,
      bold: boolean,
      italic: boolean,
      className: string,
    }
    ```
1. Add the type to your class
    ```javascript
    export default class Foo extends React.Component<Props> {
      static defaultProps = {}
      props: Props
      ...
    ```
1. You can still deconstruct `this.props` in any of your methods in the normal way
    ```javascript
    const {bar} = this.props
    ```
1. Lint your code `yarn run lint`
1. For some lint warning you can `yarn run lint-fix` which will automagically fix things like indentation.
