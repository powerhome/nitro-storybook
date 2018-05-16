export type Item = {
  id: string,
  key?: string,
}

export type State = {
  inputs: Array<Item>
}

export type InputListProps = {
  children?: Array<React.Node>,
  onChange: () => void,
  value: Item,
}

export type WrapperProps = {
  children?: Array<React.Node>,
}