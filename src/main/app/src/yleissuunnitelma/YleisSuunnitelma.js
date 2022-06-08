import React, { Component } from "react";
import { inject, observer } from "mobx-react";
import { fullURL } from "../App";
import { YleisSuunnitelmaForm } from "./YleisSuunnitelmaForm";
import { toJS } from "mobx";

@inject("routing")
@inject("yleisSuunnitelmaStore")
@inject("notificationStore")
@observer
export default class YleisSuunnitelma extends Component {
    constructor(props, context) {
        super(props, context);
        const { tunnus = null } = this.props.match.params;
        this.state = {
            edit: tunnus ? false : true
        };
    }

    get yleissuunnitelma() {
        const tunnus = parseInt(this.props.match.params.tunnus, 10);
        return this.props.yleisSuunnitelmaStore.getOrFetch(tunnus);
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
            replace(fullURL("yleissuunnitelma/tunnus/", tunnus));
            this.setEditable(false);
        }
    }

    onRemoveSuccess() {
        this.props.routing.replace(fullURL("/yleissuunnitelmat"));
    }

    cancelNew() {
        this.props.routing.replace(fullURL("yleissuunnitelmat"));
    }

    render() {
        const { notificationStore } = this.props;
        const { edit } = this.state;
        let contentEl = <div>Ei tietoja</div>;
        if (this.yleissuunnitelma) {
            contentEl = (
                <div>
                    <YleisSuunnitelmaForm
                        values={toJS(this.yleissuunnitelma)}
                        resources={{}}
                        edit={edit}
                        onSubmit={values => {
                            this.yleissuunnitelma
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
                            this.props.yleisSuunnitelmaStore
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
                <YleisSuunnitelmaForm
                    values={{}}
                    resources={{}}
                    edit={edit}
                    onSubmit={values => {
                        this.props.yleisSuunnitelmaStore
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
