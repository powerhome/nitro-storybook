# Nitro Storybook (DEPRECATED)

This repo is deprecated. New scss and js should be added to [`playbook`](https://github.com/powerhome/playbook) or directly into `nitro-web`. Eventually, all `storybook` styles and functionality will also be moved into `playbook` or `nitro-web`. If you are touching this repository, it should be in an effort to move out logic, and not add.

This repo provides the tools to implement view components which make up the visual appearance of Nitro.

* Stylesheets for the app navigation and general appearance
* Self-contained React components for use in building views

The intent of this repo was to provide a base on which other UIs can be built such that they maintain visual consistency and the Nitro brand. That will now be the intent of `playbook`.

- [Quick Start](#quick-start)
- [Local Storybook Development in Nitro-Web](#local-storybook-development-in-nitro-web)
- [Publishing a new version](#publishing-a-new-version)
- [Updating in `nitro-web`](#updating-in-nitro-web)
- [Converting Existing Components](#converting-existing-components)

## Quick Start

From the current project directory, run:

1. ensure you are running proper node version (see `package.json` => `engines`)
1. `yarn install`
1. `yarn run storybook`
1. navigate to [localhost:9001](http://localhost:9001)

---

## Local Storybook Development in Nitro-Web

Its easy to create and test out a component on nitro in real time, even with hot reload. You can point your local storybook folder as you develop it.

#### Update the storybook in the Gemfile to a local path

```ruby
gem "nitro_sg", :path => "/path/to/storybook/locally"
```

#### Update the storybook in package.json to a local path

```js
"nitro-sg": "/path/to/storybook/locally",
```

If you have any problems with assets not showing try running:

```
bundle exec rake assets:clobber
```

---

## Publishing a new version

### 1. Increase your version

Increase your version in the following files:

```
lib/nitro_sg/version.rb
package.json
```

Be sure and run the following anytime you version up:

`yarn install && bundle install`

### 2. Prep a Storybook PR

Get your `nitro-storybook` PR approved and merged into the `nitro-storybook`'s `master` branch.

### 3. Publish as a Ruby gem

If you are not an owner of the [`nitro-sg` gem](https://rubygems.org/gems/nitro_sg), then first ask a member of the UX/UI to add you. You must have/create a free rubygems.org account first.

Once you are an owner, and your PR is merged, checkout the `master` branch and pull in your changes. Next, run `gem build nitro_sg.gemspec`. This will create the gem artifact, called something like `nitro_sg-3.4.5.gem`, where `3.4.5` is your new version.

You can then push your gem up to `rubygems.org` with `nitro_sg-3.4.5.gem`.

### 4. Publish as a NPM package

If you are not an owner of the [`nitro-sg` package](https://www.npmjs.com/package/nitro-sg), then first ask a member of the UX/UI to add you. You must have/create a free npmjs.com account first.

Once you are an owner, and your PR is merged, checkout the `master` branch and pull in your changes. Then, run `npm publish`.

---

## Updating in `nitro-web`

You’ll need to point to a something published when your ready to deploy it.

#### Rails side

Currently, `nitro_sg` is listed as a dependency in Umbrella's `Gemfile`:

```ruby
gem "nitro_sg", "3.4.5"
```

And in two component's `gemspec` files, `nitro_theme` and `apm`:

```ruby
  s.add_dependency "nitro_sg", "3.4.5"
```

After updating to a new version in these places, run `bundle install` in `apm` and `nitro_theme`. Then follow up by running `components/do.sh bundle --quiet` from root to iterate through every component and refresh their `Gemfile.lock`s. **Be sure to specify a version in you Ruby gem files! (`3.4.5`) Otherwise, fuzzy matching will not force an update across Nitro.**

#### React side

Update the `package.json` in the `nitro_react` component with a version like so:

```js
"nitro-sg": "3.4.5",
```

Then be sure to run `yarn install` in both `nitro_react` and on Umbrella.

#### Debugging

If your updated styling does not show up, you may have old assets you need to remove. Try
`bundle exec rake assets:clobber`

---

## Converting Existing Components

Conversion of existing components to `nitro_react` is a little different since we already have a decent class structure in the jsx component. There are, however, a few considerations:

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
