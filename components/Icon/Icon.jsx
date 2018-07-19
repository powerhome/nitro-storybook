import React from "react"
import FontAwesome from "react-fontawesome"
import classnames from "classnames"
import { IconType } from "../types"

import styles from "./styles.scss"

/**
 * Icon renders a FontAwesome icon followed by a label.
 *
 * @param {string} name FontAwesome icon's name. For the icon 'fa-paperclip' for
 * example, its name would be 'paperclip'.
 * @param {string} label the text to use as a label.
 * @param {string} size an optional FontAwesome icon size ('lg', '2x', '3x', etc).
 * @param {func} onClick the function to be called when the React onClick event is triggered.
 * @param {string} className class name is an option on the FontAwesome package that adds a class to the FontAwesome span.
 * @param {string} title an optional title as a tooltip on mouse hover.
 * @returns {ReactElement} JSX.
 */

export default class Icon extends React.Component<Props> {
  static defaultProps = {
    label: "",
    rotate: null,
    spin: false,
  }
  props: IconType
  render() {
    const {
      name,
      label,
      rotate,
      size,
      spin,
      onClick,
      className,
      title
    } = this.props
    return (
      <span
          className={classnames("icon", styles.icon, rotate ? styles[`rotate-${rotate}`] : "")}
          onClick={onClick}
          title={title}
      >
        <FontAwesome
            className={`far ${className}`}
            name={name}
            size={size}
            spin={spin}
        />
        <If condition={label}>{label}</If>
      </span>
    )
  }
}
