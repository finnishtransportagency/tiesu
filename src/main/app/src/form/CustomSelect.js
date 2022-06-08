import React from "react";
import { FormField } from "react-form";
import Select from "react-select";

class CustomSelectWrapper extends React.Component {
    handleChange = selection => {
        if (this.props.onChange) this.props.onChange(selection);
        else if (selection && selection.hasOwnProperty("value"))
            this.props.fieldApi.setValue(selection.value);
    };

    render() {
        const {
            fieldApi,
            readOnly,
            resourceField = null,
            useID = false,
            optionsReady = false,
            onChange,
            className,
            ...rest
        } = this.props;

        const { getError } = fieldApi;

        const { getValue, setTouched } = fieldApi;
        const field = fieldApi.getFieldName();

        // Use "resourceField" if specified else "field".
        // If field is array (see react-form doc) take the last item
        let fieldName = resourceField;
        if (!fieldName)
            fieldName = Array.isArray(field) ? field.slice(-1)[0] : field;

        const resources = this.props.resources || {}; // destructuring default does not apply to null
        const fieldResources = resources[fieldName] || {};
        let options = [];

        if (optionsReady) {
            options = fieldResources;
        } else {
            Object.entries(fieldResources).forEach(([key, value]) => {
                const optionValue = useID ? parseInt(key, 10) : value;
                options.push({ value: optionValue, label: value });
            });
            options = options.sort((a, b) => a.label.localeCompare(b.label));
        }
        let val = getValue();

        const error = getError();
        const newClassName =
            className + (error ? " react-form-input-error" : "");

        return (
            <div>
                <Select
                    field={field}
                    options={options}
                    disabled={readOnly}
                    value={val}
                    className={newClassName}
                    onChange={this.handleChange}
                    onBlur={() => setTouched()}
                    noResultsText="Ei tuloksia"
                    {...rest}
                    clearable={false}
                />
                {error ? (
                    <small className="react-form-message react-form-message-error">
                        {error}
                    </small>
                ) : null}
            </div>
        );
    }
}

export const CustomSelect = FormField(CustomSelectWrapper);
