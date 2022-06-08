import React, { Component } from "react";
import Modal, { getCancelModal, getDeleteModal } from "./modal";
import moment from 'moment';
import 'moment/locale/fi';

export function validateAll(values, ...validationFunctions) {
    let sum = Object.assign({}, values);
    Object.keys(sum).forEach(key => (sum[key] = null));
    sum.hasErrors = false;

    if (values) {
        validationFunctions.forEach(func => Object.assign(sum, func(values)));
    }
    return sum;
}

export function validate(values) {
    if (values) {
        let result = { nimi: null, asianumero: null };
        let dates = [ "hyvaksymisesitysLaadittu", "hyvaksymisesitysSaapunut",
                    "aloituskuulutus", "hyvaksymispaatosAnnettu",
                    "palautettuElylle", "jatkopaatosAnnettu1",
                    "jatkopaatosAnnettu2", "hyvaksymisesitysLvmLaadittu",
                    "hyvaksymispaatosLvmAnnettu", "jatkopaatosLvmAnnettu",
                    "osapaatosAnnettu", "paatosHao",
                    "paatosKho", "lainvoimaisuudenPaattyminen",
                    "kayttoonottoLuovutusOsa", "kayttoonottoLuovutusKoko",
                    "lainvoimaisuus", "liikenteeseenOsaLuovutus",
                    "liikenteeseenKokoLuovutus", "ratatoimitusTehty",
                    "maantietoimitusTehty" ]
        if (empty(values.nimi)) {
            result.nimi = "Nimi vaaditaan";
        }
        if (empty(values.asianumero)) {
            result.asianumero = "Asianumero vaaditaan";
        }
        dates.forEach(field => {
            if (values[field]) {
                const date = moment(values[field], "D.M.YYYY", true)
                if (!date || !date.isValid()) result[field] = "Päivämäärän muoto väärä. Käytä pp.kk.vvvv";
            }
        });
        return result;
    } else {
        return null;
    }
}

function empty(value) {
    return !(value !== undefined && value.trim() !== "");
}

export class FormControls extends Component {
    //TODO: refactor so that FormControls does not need values. Done in dynamic form
    constructor(props) {
        super(props);
        this.state = {
            showModal: false,
            currModal: null
        };
    }

    save = () => {
        if (this.props.values && this.props.values.tunnus) {
            this.props.setEditable(false);
            this.props.submitForm(this.props.values);
        } else {
            this.props.submitForm(this.props.values);
        }
    };

    cancel = () => {
        if (this.props.values && this.props.values.tunnus) {
            this.props.setEditable(false);
            this.props.resetForm();
        } else {
            this.props.cancelNew();
        }
    };

    showModalOnCancel = () => {
        if (this.props.noCheck) this.cancel();
        else {
            const noCallback = () => this.setState({ currModal: null });
            const yesCallback = () => {
                this.setState({ currModal: null });
                this.cancel();
            };
            this.setState({
                currModal: getCancelModal(noCallback, yesCallback)
            });
        }
    };

    showModalOnDelete = () => {
        if (this.props.noCheck) this.props.remove(this.props.values.tunnus);
        else {
            const noCallback = () => this.setState({ currModal: null });
            const yesCallback = () =>
                this.props.remove(this.props.values.tunnus);
            this.setState({
                currModal: getDeleteModal(noCallback, yesCallback)
            });
        }
    };

    getCurrModal = () => {
        const currModal = this.state.currModal;
        const buttons = (currModal && currModal.buttons) || null;
        const header = (currModal && currModal.header) || null;
        const body = (currModal && currModal.body) || null;
        return (
            <Modal
                buttons={buttons}
                header={header}
                body={body}
                showModal={this.state.currModal}
            />
        );
    };

    render() {
        const {
            edit,
            values = {},
            errors = {},
            setEditable,
            children,
            inline = false
        } = this.props;

        const disabled = {
            save: errors.hasErrors,
            remove: false,
            create: errors.hasErrors,
            cancel: false,
            edit: errors.hasErrors
        };

        const bottomControl = inline ? "" : "form-controls float-bottom";
        const validationErrors = Object.values(validate(values)).filter(val => val!==null).length > 0;

        return (
            <div className={bottomControl}>
                {edit &&
                    values.tunnus && (
                        <div className="btn-toolbar">
                            <button
                                type="button"
                                className="btn btn-primary"
                                onClick={() => this.save()}
                                disabled={validationErrors || (disabled && disabled.save)}
                            >
                                Tallenna
                            </button>

                            <button
                                type="button"
                                className="btn btn-default"
                                onClick={() => this.showModalOnCancel()}
                                disabled={disabled && disabled.cancel}
                            >
                                Peruuta
                            </button>

                            <button
                                type="button"
                                className="btn btn-danger"
                                onClick={() => this.showModalOnDelete()}
                                disabled={disabled && disabled.remove}
                            >
                                Poista
                            </button>
                        </div>
                    )}
                {edit &&
                    !values.tunnus && (
                        <div className="btn-toolbar">
                            <button
                                type="button"
                                className="btn btn-primary"
                                onClick={() => this.save()}
                                disabled={validationErrors || (disabled && disabled.create)}
                            >
                                Tallenna
                            </button>

                            <button
                                type="button"
                                className="btn btn-default"
                                onClick={() => this.showModalOnCancel()}
                                disabled={disabled && disabled.cancel}
                            >
                                Peruuta
                            </button>
                        </div>
                    )}
                {!edit && (
                    <div className="btn-toolbar">
                        <button
                            type="button"
                            className="btn btn-primary"
                            onClick={() => setEditable(true)}
                            disabled={disabled && disabled.edit}
                        >
                            Muokkaa
                        </button>
                        {children}
                    </div>
                )}
                {this.getCurrModal()}
            </div>
        );
    }
}
