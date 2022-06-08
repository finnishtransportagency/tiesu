import React from "react";
import { FormField } from "react-form";
import NumberFormat from 'react-number-format';

class CustomNumberWrapper extends React.Component {
    render() {
        const { fieldApi, className, placeholder, readOnly, ...rest, } = this.props;

        const {
            getValue,
            setValue
        } = fieldApi;

        let numberField = <NumberFormat
                                className={className}
                                thousandSeparator=" "
                                decimalSeparator=","
                                disabled={readOnly}
                                isNumericString={true}
                                value={getValue()}
                                onValueChange={(values) => {
                                    setValue(values.value);
                                }}
                                {...rest}
                            />
        return numberField;
    }
}

export const CustomNumber = FormField(CustomNumberWrapper);