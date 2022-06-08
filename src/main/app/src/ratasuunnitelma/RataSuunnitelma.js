import React, { Component } from "react";
import { inject, observer } from "mobx-react";
import { fullURL } from "../App";
import { RataSuunnitelmaForm } from "./RataSuunnitelmaForm";
import { toJS } from "mobx";

@inject("routing")
@inject("rataSuunnitelmaStore")
@inject("notificationStore")
@observer
export default class RataSuunnitelma extends Component {
    constructor(props, context) {
        super(props, context);
        const { tunnus = null } = this.props.match.params;
        this.state = {
            edit: tunnus ? false : true
        };
    }

    get ratasuunnitelma() {
        const tunnus = parseInt(this.props.match.params.tunnus, 10);
        return this.props.rataSuunnitelmaStore.getOrFetch(tunnus);
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
            replace(fullURL("ratasuunnitelma/tunnus/", tunnus));
            this.setEditable(false);
        }
    }

    onRemoveSuccess() {
        this.props.routing.replace(fullURL("/ratasuunnitelmat"));
    }

    cancelNew() {
        this.props.routing.replace(fullURL("ratasuunnitelmat"));
    }

    render() {
        const { notificationStore } = this.props;
        const { edit } = this.state;
        let contentEl = <div>Ei tietoja</div>;
        if (this.ratasuunnitelma) {
            contentEl = (
                <div>
                    <RataSuunnitelmaForm
                        values={toJS(this.ratasuunnitelma)}
                        resources={{}}
                        edit={edit}
                        onSubmit={values => {
                            this.ratasuunnitelma
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
                            this.props.rataSuunnitelmaStore
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
                <RataSuunnitelmaForm
                    values={{}}
                    resources={{}}
                    edit={edit}
                    onSubmit={values => {
                        this.props.rataSuunnitelmaStore
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
