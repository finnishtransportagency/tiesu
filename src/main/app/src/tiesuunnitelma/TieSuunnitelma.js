import React, { Component } from "react";
import { inject, observer } from "mobx-react";
import { fullURL } from "../App";
import { TieSuunnitelmaForm } from "./TieSuunnitelmaForm";
import { toJS } from "mobx";

@inject("routing")
@inject("tieSuunnitelmaStore")
@inject("notificationStore")
@observer
export default class TieSuunnitelma extends Component {
    constructor(props, context) {
        super(props, context);
        const { tunnus = null } = this.props.match.params;
        this.state = {
            edit: tunnus ? false : true
        };
    }

    get tiesuunnitelma() {
        const tunnus = parseInt(this.props.match.params.tunnus, 10);
        return this.props.tieSuunnitelmaStore.getOrFetch(tunnus);
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
            replace(fullURL("tiesuunnitelma/tunnus/", tunnus));
            this.setEditable(false);
        }
    }

    onRemoveSuccess() {
        this.props.routing.replace(fullURL("/tiesuunnitelmat"));
    }

    cancelNew() {
        this.props.routing.replace(fullURL("tiesuunnitelmat"));
    }

    render() {
        const { notificationStore } = this.props;
        const { edit } = this.state;
        let contentEl = <div>Ei tietoja</div>;
        if (this.tiesuunnitelma) {
            contentEl = (
                <div>
                    <TieSuunnitelmaForm
                        values={toJS(this.tiesuunnitelma)}
                        resources={{}}
                        edit={edit}
                        onSubmit={values => {
                            this.tiesuunnitelma
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
                            this.props.tieSuunnitelmaStore
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
                <TieSuunnitelmaForm
                    values={{}}
                    resources={{}}
                    edit={edit}
                    onSubmit={values => {
                        this.props.tieSuunnitelmaStore
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
