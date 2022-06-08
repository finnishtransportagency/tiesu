import React, { Component } from "react";
import { FormField } from "react-form";
import Select from "react-select";
import axios from "axios";
import { inject } from "mobx-react";
import {fullRestURL} from "../App";
@inject("notificationStore")

class CustomResourceSelectWrapper extends Component {
    constructor(props) {
        super(props);
        const initialPerson = this.props.resources;
        const initialSelected = initialPerson
            ? {
                  value: initialPerson.tunnus,
                  label: props.selectToLabel(initialPerson),
                  person: initialPerson
              }
            : {};
        this.state = {
            selected: initialSelected,
            options: [],
            input: {},
            isLoading: false
        };
    }

    componentWillMount() {
    }

    validateNameInput(input, encode) {
        return encode ? input.replace(" ", "%20") : input.replace("%20", " ");
    }

    setOptions = input => {
        const { notificationStore } = this.props;
        input = this.validateNameInput(input, true);
        this.setState({ isLoading: true }, function() {
            axios.get(`${fullRestURL()}/FIM`, {params: {filter: input}}).then(response => {
                const options = response.data.items.map(person => ({
                    value: person.tunnus,
                    label: this.props.selectToLabel(person),
                    person: person
                }));
            this.setState({ options: options, isLoading: false });
        })
        .catch(function(error) {
                notificationStore.addError("Virhe tallennuksessa", error);
            });
        });
    };

    onInputChange = inputVal => {
        this.setState({ input: inputVal });
    };

    onInputKeyDown = event => {
        switch (event.keyCode) {
            case 13: // ENTER
                // Override default ENTER behavior by doing stuff here and then preventing default
                event.preventDefault();
                this.setOptions(this.state.input);
                break;
            default:
                // Satisfy linter
                break;
        }
    };

    render() {
        const {
            fieldApi,
            readOnly,
            rooliId,
            customOnChange,
            getClassName,
            ...rest
        } = this.props;
        const { setValue, getValue } = fieldApi;
        const field = fieldApi.getFieldName();

        // eslint-disable-next-line no-unused-vars
        function arrowRenderer() {
            return <span>+</span>;
        }

        return (
            <Select
                className={getClassName(
                    this.state.selected && this.state.selected.person
                )}
                field={field}
                disabled={readOnly}
                onInputChange={this.onInputChange}
                onChange={selection =>
                    customOnChange(selection, setValue, getValue, rooliId, this)
                }
                value={this.state.selected}
                onInputKeyDown={this.onInputKeyDown}
                options={this.state.options}
                isLoading={this.state.isLoading}
                noResultsText="Ei tuloksia"
                filterOption={() => true}
                {...rest}
            />
        );
    }
}

export const CustomResourceSelect = FormField(CustomResourceSelectWrapper);
