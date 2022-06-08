import React, { Component } from "react";
import { inject, observer } from "mobx-react";
import { fullURL } from "../App";
import { RautatienYleisSuunnitelmaForm } from "./RautatienYleisSuunnitelmaForm";
import { toJS } from "mobx";

@inject("routing")
@inject("rautatienYleisSuunnitelmaStore")
@inject("notificationStore")
@observer
export default class RautatienYleisSuunnitelma extends Component {
    constructor(props, context) {
        super(props, context);
        const { tunnus = null } = this.props.match.params;
        this.state = {
            edit: tunnus ? false : true
        };
    }

    get rautatienYleissuunnitelma() {
        const tunnus = parseInt(this.props.match.params.tunnus, 10);
        return this.props.rautatienYleisSuunnitelmaStore.getOrFetch(tunnus);
    }

    setEditable(editable) {
        this.setState({ edit: editable });
    }

    onSuccess(data) {
        const { tunnus } = data;
        if (tunnus) {
            this.setEditable(false);
        }
    }

    onCreateSuccess(data) {
        const { tunnus } = data;
        const { replace } = this.props.routing;
        if (tunnus && replace) {
            replace(fullURL("rautatienyleissuunnitelma/tunnus/", tunnus));
            this.setEditable(false);
        }
    }

    onRemoveSuccess() {
        this.props.routing.replace(fullURL("/rautatienyleissuunnitelmat"));
    }

    cancelNew() {
        this.props.routing.replace(fullURL("rautatienyleissuunnitelmat"));
    }

    render() {
        const { notificationStore } = this.props;
        const { edit } = this.state;
        let contentEl = <div>Ei tietoja</div>;
        if (this.rautatienYleissuunnitelma) {
            contentEl = (
                <div>
                    <RautatienYleisSuunnitelmaForm
                        values={toJS(this.rautatienYleissuunnitelma)}
                        resources={{}}
                        edit={edit}
                        onSubmit={values => {
                            this.rautatienYleissuunnitelma
                                .save(values)
                                .then(response => {
                                    this.onSuccess(response.data);
                                })
                                .catch(function(error) {
                                    notificationStore.addError(
                                        "Virhe tallennuksessa",
                                        error
                                    );
                                });
                        }}
                        remove={tunnus => {
                            this.props.rautatienYleisSuunnitelmaStore
                                .remove(tunnus)
                                .then(response => {
                                    this.onRemoveSuccess();
                                })
                                .catch(function(error) {
                                    notificationStore.addError(
                                        "Virhe tallennuksessa",
                                        error
                                    );
                                });
                        }}
                        setEditable={editable => this.setEditable(editable)}
                    />
                </div>
            );
        } else if (!this.props.match.params.tunnus) {
            contentEl = (
                <RautatienYleisSuunnitelmaForm
                    values={{}}
                    resources={{}}
                    edit={edit}
                    onSubmit={values => {
                        this.props.rautatienYleisSuunnitelmaStore
                            .createFromValues(values)
                            .then(response => {
                                this.onCreateSuccess(response.data);
                            })
                            .catch(function(error) {
                                notificationStore.addError(
                                    "Virhe tallennuksessa",
                                    error
                                );
                            });
                    }}
                    setEditable={editable => this.setEditable(editable)}
                    cancelNew={() => this.cancelNew()}
                />
            );
        }

        return contentEl;
    }
}
