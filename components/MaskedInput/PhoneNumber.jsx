/* @flow */

import React from 'react'
import MaskedInput from './MaskedInput'

type Props = {|
  defaultValue?: string,
  international?: boolean,
|}

const PhoneNumber = ({
  defaultValue,
  international,
}: Props) => {
  return (
    <MaskedInput
        defaultValue={defaultValue}
        mask={international ? 'phone-intl' : 'phone'}
        maxLength={international ? 11 : 10}
    />
  )
}

export default PhoneNumber