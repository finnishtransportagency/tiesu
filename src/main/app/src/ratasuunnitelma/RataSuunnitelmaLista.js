/* eslint no-restricted-globals: 0 */
import React, { Component } from "react";
import RataSuunnitelmaGriddle from "./RataSuunnitelmaGriddle";
import { inject } from "mobx-react";

@inject("rataSuunnitelmaStore")
export default class RataSuunnitelmaLista extends Component {
    constructor(props, context) {
        super(props);
    }

    render() {
        const { rataSuunnitelmaStore } = this.props;
        return <RataSuunnitelmaGriddle dataStore={rataSuunnitelmaStore} />;
    }
}
