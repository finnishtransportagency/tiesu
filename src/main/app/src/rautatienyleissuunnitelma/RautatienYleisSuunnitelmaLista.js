/* eslint no-restricted-globals: 0 */
import React, { Component } from "react";
import RautatienYleisSuunnitelmaGriddle from "./RautatienYleisSuunnitelmaGriddle";
import { inject } from "mobx-react";

@inject("rautatienYleisSuunnitelmaStore")
export default class RautatienYleisSuunnitelmaLista extends Component {
    constructor(props, context) {
        super(props);
    }

    render() {
        const { rautatienYleisSuunnitelmaStore } = this.props;
        return (
            <RautatienYleisSuunnitelmaGriddle
                dataStore={rautatienYleisSuunnitelmaStore}
            />
        );
    }
}
