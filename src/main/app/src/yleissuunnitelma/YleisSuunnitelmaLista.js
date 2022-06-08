/* eslint no-restricted-globals: 0 */
import React, { Component } from "react";
import YleisSuunnitelmaGriddle from "./YleisSuunnitelmaGriddle";
import { inject } from "mobx-react";

@inject("yleisSuunnitelmaStore")
export default class YleisSuunnitelmaLista extends Component {
    constructor(props, context) {
        super(props);
    }

    render() {
        const { yleisSuunnitelmaStore } = this.props;
        return <YleisSuunnitelmaGriddle dataStore={yleisSuunnitelmaStore} />;
    }
}
