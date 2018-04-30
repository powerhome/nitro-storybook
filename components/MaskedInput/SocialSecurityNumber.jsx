/* @flow */

import React from 'react'
import MaskedInput from './MaskedInput'

type Props = {|
  defaultValue?: string,
|}

const SocialSecurityNumber = ({
  defaultValue,
}: Props) => {
  return (
    <MaskedInput
        defaultValue={defaultValue}
        mask='ssn'
        maxLength={9}
    />
  )
}

export default SocialSecurityNumber