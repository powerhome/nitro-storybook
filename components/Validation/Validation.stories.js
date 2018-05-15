import React from "react"
import { Validate, ValidationGroup } from "./"

import styles from "./styles.stories.scss"

const validationState = (valid) => {
    if (valid === undefined) return ""
    return valid ? "Yes" : "No"
}

const ApplicantSection = ({ name, email, onChange, valid }) => (
    <div>
        <div>{"Is this section valid? "}<strong>{validationState(valid)}</strong></div>
        <div className="group">
            <label>Name:</label>
            <Validate>
                <input name="name" value={name} onChange={onChange} required />
            </Validate>
        </div>
        <div className="group">
            <label>Email:</label>
            <Validate>
                <input type="email" name="email" value={email} onChange={onChange} required />
            </Validate>
        </div>
    </div>
)

const IncomeSourceSection = ({ source, income, onChange, valid }) => (
    <div>
        <div>{`Is this section valid? `}<strong>{validationState(valid)}</strong></div>
        <div className="group">
            <label>Source:</label>
            <Validate>
                <input name="source" value={source} onChange={onChange} required />
            </Validate>
        </div>
        <div className="group">
            <label>Income:</label>
            <Validate propagate>
                <input type="number" name="income" value={income} onChange={onChange} required />
            </Validate>
        </div>
    </div>
)

const FormValidationState = ({ valid }) => (
    <div>{`Is the entire form valid? `}<strong>{validationState(valid)}</strong></div>
)

export default function RequiredInput(stories) {
  stories.add("Form required fields", () => {
    class Example extends React.Component {
        state = {}

        handleChange = (e) => {
            this.setState({
                [e.target.name]: e.target.value
            })
        }

        handleValidate = (e) => {
            const valid = this.form.checkValidity()
            const inputs = this.form.querySelectorAll("input, select, textarea")
            inputs.forEach(input => {
                const valid = input.checkValidity()
                console.log(">>> input", input.name, "valid?", valid)
            })
        }

        render() {
            return (
                <form ref={form => this.form = form} onSubmit={e => e.preventDefault()}>
                    <ValidationGroup propagate>
                        <FormValidationState />

                        <ValidationGroup propagate>
                            <ApplicantSection name={this.state.name} email={this.state.email} onChange={this.handleChange} />
                        </ValidationGroup>

                        <ValidationGroup propagate>
                            <IncomeSourceSection source={this.state.source} income={this.state.income} onChange={this.handleChange} />
                        </ValidationGroup>
                    </ValidationGroup>

                    <button onClick={this.handleValidate}>{"Validate"}</button>
                </form>
            )
        }
    }

    return <Example />
  })
}