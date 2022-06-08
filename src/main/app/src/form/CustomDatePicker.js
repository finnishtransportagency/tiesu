import React from 'react';
import {FormField, Text} from 'react-form';
import DatePicker from 'react-datepicker';
import moment from 'moment';
import 'moment/locale/fi';

// NB some old fields (eg. "lainvoimaisuus") might be strings and contain random text.
// Therefore the field accepts any text but shows red outline if user inputs non-valid date
class CustomDatePickerWrapper extends React.Component {
    constructor() {
        super();
        this.defaultDateFormat = "D.M.YYYY";
        this.state = { error: "" };
    }

    handleChange = date => {
        this.props.fieldApi.reset(this.props.id);
        this.props.fieldApi.setValue(this.formatDateToString(date));
        this.setState({error: ""});
    }

    clear() {
        this.props.fieldApi.reset(this.props.id);
        this.props.fieldApi.setValue(null);
        this.setState({error: ""});
    }

    formatDateToString (date) {
        const format = "DD.MM.YYYY";
        return moment(date, format, true).format(format)
    }

    formatStringToDate (dateString) {
        const format = this.props.dateFormat || this.defaultDateFormat;
        return moment(dateString, format, true)
    }

    componentDidUpdate (prevProps) {
        // Handle the case when there is old erraneous data and we enter edit mode
        if (prevProps.readOnly !== this.props.readOnly && !this.props.readOnly) {
            const value = this.props.fieldApi.getValue();
            if (!value) {
                return
            }
            const date = this.formatStringToDate(value);
            if (!date || !date.isValid()) {
                this.props.fieldApi.setError({[this.props.id]: "Vääränlainen päivämäärä"});
                this.setState({error: " react-form-input-error react-form-text-error"});
            }
        }
    } 

    render() {

        const { fieldApi, field, className, id, placeholder, readOnly, dateFormat = "D.M.YYYY", ...rest, } = this.props;
        
        const {
            getValue,
        } = fieldApi;

        const fieldLocale = `fieldLocale_${id}`;
        moment.locale('fi');

        const inputDate = getValue() ? this.formatStringToDate(getValue()) : null;
        let datePickerSelection = null
        if (inputDate && inputDate.isValid()) {
            datePickerSelection = inputDate;
        }

        const DateComponent = <DatePicker
                                customInput={<CalendarButton />}
                                locale={fieldLocale}
                                dateFormat={dateFormat}
                                className={className}
                                disabled={readOnly} 
                                selected={datePickerSelection}
                                onChange={this.handleChange}
                                popperPlacement="auto"
                                dateFormatCalendar="MMMM"
                                showYearDropdown
                                {...rest}
                            />

        const DateInput = <Text
                                fieldApi={fieldApi}
                                id={id}
                                field={field}
                                className={className  + this.state.error}
                                placeholder={placeholder}
                                readOnly={readOnly}
                                onKeyUp={(event) => {
                                    if (event.target.value.length === 0) {
                                        this.clear();
                                        return;
                                    }

                                    // Do not validate on backspace, del or arrowkeys
                                    if ([8, 37, 38, 39, 40, 46].includes(event.keyCode)) return;

                                    const date = this.formatStringToDate(event.target.value);
                                    if (date && date.isValid()) {
                                        this.handleChange(date);
                                    }
                                    else {
                                        this.props.fieldApi.setError({[this.props.id]: "Vääränlainen päivämäärä"});
                                        this.setState({error: " react-form-input-error react-form-text-error"});
                                    }
                                }}
                                {...rest}
                            />

            const CalendarIcon = readOnly ? null : <div className="input-group-addon">
                                                        {DateComponent}
                                                    </div>
        
        
        return (
            <div className="input-group">
                {DateInput}
                {CalendarIcon}
            </div>
        )
    }
}

class CalendarButton extends React.Component {

    render () {
      return (
            <a role="button"
                onClick={this.props.onClick}>
                <i className="fa fa-calendar"></i>
            </a>
      )
    }
  }

export const CustomDatePicker = FormField(CustomDatePickerWrapper);