/* eslint no-restricted-globals: 0 */
import React, { Component } from "react";
import TieSuunnitelmaGriddle from "./TieSuunnitelmaGriddle";
import { inject } from "mobx-react";

@inject("tieSuunnitelmaStore")
export default class TieSuunnitelmaLista extends Component {
    constructor(props, context) {
        super(props);
    }

    render() {
        const { tieSuunnitelmaStore } = this.props;
        return <TieSuunnitelmaGriddle dataStore={tieSuunnitelmaStore} />;
    }
}
