import React from "react"
import SocialSecurityNumber from "./SocialSecurityNumber"
import PhoneNumber from "./PhoneNumber"

import { Col, ControlLabel, FormGroup, Row } from 'react-bootstrap'

import { withInfo } from '@storybook/addon-info'

export default function MaskedInputStory(stories) {
  stories.add(
    "Masked Inputs (multiple)",
    withInfo("Various types of masked inputs")(() => {
      return (
        <Row>
          <Col md={4}>
            <FormGroup className="label-inside">
              <ControlLabel>{`Social Security Number`}</ControlLabel>
              <SocialSecurityNumber
                  defaultValue='123885421'
              />
            </FormGroup>
          </Col>
          <Col md={4}>
            <FormGroup className="label-inside">
              <ControlLabel>{`Phone Number`}</ControlLabel>
              <PhoneNumber
                  defaultValue='9138574852'
              />
            </FormGroup>
          </Col>
          <Col md={4}>
            <FormGroup className="label-inside">
              <ControlLabel>{`Phone Number (Intl)`}</ControlLabel>
              <PhoneNumber
                  defaultValue='19138574855'
                  international
              />
            </FormGroup>
          </Col>
        </Row>
      )
    })
  )
}
