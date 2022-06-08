import React from "react";
import { Form, Text, Radio, RadioGroup, StyledText } from "react-form";
import {
    kohdeEnum,
    suunnitelmanStatusEnum
} from "../stores/RataSuunnitelmaStore";
import { LinkifyTextArea as TextArea } from "../form/LinkifyTextArea";
import { FormControls, validate } from "../form/FormControls";
import { CustomCollapse as Collapse } from "../form/CustomCollapse";
import { CustomSelect as Select } from "../form/CustomSelect";
import { CustomDatePicker } from "../form/CustomDatePicker";
import { CustomNumber } from "../form/CustomNumber";


export class RataSuunnitelmaForm extends React.Component {
    render() {
        const {
            edit,
            onSubmit,
            remove,
            setEditable,
            cancelNew,
            values
        } = this.props;

        let resources = {
            suunnitelmanStatus: suunnitelmanStatusEnum,
            kohde1: [],
            kohde2: []
        };

        kohdeEnum.forEach((item, index) => {
            resources.kohde1.push({
                value: index + 1,
                label: item
            });
            resources.kohde2.push({
                value: index + 1,
                label: item
            });
        });

        // Convert 0 or 1 values to strings to make the radio buttons work properly
        values.yvaHanke = (values.yvaHanke !== null && typeof values.yvaHanke !== "undefined")
            ? values.yvaHanke.toString()
            : null;
        values.sisaltaaLakkaamisen = (values.sisaltaaLakkaamisen !== null && typeof values.sisaltaaLakkaamisen !== "undefined")
            ? values.sisaltaaLakkaamisen.toString()
            : null;
        values.sisaltaaTieSuunnittelua = (values.sisaltaaTieSuunnittelua !== null && typeof values.sisaltaaTieSuunnittelua !== "undefined")
            ? values.sisaltaaTieSuunnittelua.toString()
            : null;
        values.kiirellinenKasittelyPyydetty = (values.kiirellinenKasittelyPyydetty !== null && typeof values.kiirellinenKasittelyPyydetty !== "undefined")
            ? values.kiirellinenKasittelyPyydetty.toString()
            : null;
        values.hyvaksymispaatosHaoKumottu = (values.hyvaksymispaatosHaoKumottu !== null && typeof values.hyvaksymispaatosHaoKumottu !== "undefined")
            ? values.hyvaksymispaatosHaoKumottu.toString()
            : null;
        values.hyvaksymispaatosKhoKumottu = (values.hyvaksymispaatosKhoKumottu !== null && typeof values.hyvaksymispaatosKhoKumottu !== "undefined")
            ? values.hyvaksymispaatosKhoKumottu.toString()
            : null;

        return (
            <Form
                validateError={values => {
                    return validate(values);
                }}
                dontValidateOnMount={true}
                validateOnSubmit={true}
                onSubmit={values => {
                    values.yvaHanke = parseInt(values.yvaHanke, 10);
                    values.sisaltaaLakkaamisen = parseInt(values.sisaltaaLakkaamisen, 10);
                    values.sisaltaaTieSuunnittelua = parseInt(values.sisaltaaTieSuunnittelua, 10);
                    values.kiirellinenKasittelyPyydetty = parseInt(values.kiirellinenKasittelyPyydetty, 10);
                    values.hyvaksymispaatosHaoKumottu = parseInt(values.hyvaksymispaatosHaoKumottu, 10);
                    values.hyvaksymispaatosKhoKumottu = parseInt(values.hyvaksymispaatosKhoKumottu, 10);
                    onSubmit(values);
                }}
                getApi={formApi => {
                    formApi.setAllValues(values);
                }}
                defaultValues={values}
            >
                {formApi => (
                    <form onSubmit={formApi.submitForm}>
                        <Collapse
                            header={`Ratasuunnitelma: ${values.nimi || ""}`}
                            isOpened={true}
                        >
                            <div className="form-group row">
                                <div className="col-sm-6">
                                    <div className="col-sm-12 required">
                                        <label htmlFor="nimi" className="row">
                                            Nimi
                                        </label>
                                        <div className="row">
                                            <StyledText
                                                field="nimi"
                                                type="text"
                                                className="tk-field form-control"
                                                id="nimi"
                                                placeholder=""
                                                readOnly={!edit}
                                            />
                                        </div>
                                    </div>
                                </div>
                                <div className="col-sm-6">
                                    <div className="col-sm-12">
                                        <label
                                            htmlFor="kasittelija"
                                            className="row"
                                        >
                                            Projektipäällikkö
                                        </label>
                                        <div className="row">
                                            <Text
                                                field="kasittelija"
                                                type="text"
                                                className="tk-field form-control"
                                                id="kasittelija"
                                                placeholder=""
                                                readOnly={!edit}
                                            />
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div className="form-group row">
                                <div className="col-sm-6">
                                    <div className="col-sm-12">
                                        <label htmlFor="kuvaus" className="row">
                                            Kuvaus
                                        </label>
                                        <div className="row">
                                            <TextArea
                                                field="kuvaus"
                                                type="text"
                                                className="tk-field form-control"
                                                id="kuvaus"
                                                rows="3"
                                                placeholder=""
                                                readOnly={!edit}
                                            />
                                        </div>
                                    </div>
                                </div>
                                <div className="col-sm-6">
                                    <div className="col-sm-12">
                                        <label
                                            htmlFor="yvaHanke"
                                            className="row"
                                        >
                                            YVA-hanke
                                        </label>
                                        <div className="row">
                                            <RadioGroup
                                                id="yvaHanke"
                                                className="tk-field form-control"
                                                readOnly={!edit}
                                                field="yvaHanke"
                                            >
                                                {group => (
                                                    <div className="row">
                                                        <div className="col-xs-6 col-md-6 col-lg-2 nowrap">
                                                            <Radio
                                                                group={group}
                                                                value={"1"}
                                                                disabled={!edit}
                                                            />
                                                            &nbsp;
                                                            <span>Kyllä</span>
                                                        </div>
                                                        <div className="col-xs-6 col-md-6 col-lg-2 nowrap">
                                                            <Radio
                                                                group={group}
                                                                value={"0"}
                                                                disabled={!edit}
                                                            />
                                                            &nbsp;
                                                            <span>Ei</span>
                                                        </div>
                                                    </div>
                                                )}
                                            </RadioGroup>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div className="form-group row">
                                <div className="col-sm-4">
                                    <div className="col-sm-12 required">
                                        <label
                                            htmlFor="asianumero"
                                            className="row"
                                        >
                                            Asianumero
                                        </label>
                                        <div className="row">
                                            <StyledText
                                                field="asianumero"
                                                type="text"
                                                className="tk-field form-control"
                                                id="asianumero"
                                                placeholder=""
                                                readOnly={!edit}
                                            />
                                        </div>
                                    </div>
                                </div>
                                <div className="col-sm-4">
                                    <div className="col-sm-12">
                                        <label
                                            htmlFor="elyKeskus"
                                            className="row"
                                        >
                                            ELY-keskus
                                        </label>
                                        <div className="row">
                                            <Text
                                                field="elyKeskus"
                                                type="text"
                                                className="tk-field form-control"
                                                id="elyKeskus"
                                                placeholder=""
                                                readOnly={!edit}
                                            />
                                        </div>
                                    </div>
                                </div>
                                <div className="col-sm-4">
                                    <div className="col-sm-12">
                                        <label
                                            htmlFor="suunnitelmanStatus"
                                            className="row"
                                        >
                                            Suunnitelman status
                                        </label>
                                        <div className="row">
                                            <Select
                                                field="suunnitelmanStatus"
                                                className="tk-field form-control"
                                                id="suunnitelmanStatus"
                                                placeholder=""
                                                readOnly={!edit}
                                                resources={resources}
                                                optionsReady={true}
                                                noResultsText="Ei tuloksia"
                                            />
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div className="form-group row">
                                <div className="col-sm-4">
                                    <div className="col-sm-12">
                                        <label
                                            htmlFor="hyvaksymisesitysLaadittu"
                                            className="row"
                                        >
                                            Hyväksymisesitys laadittu/Traficomiin
                                            (pp.kk.vvvv)
                                        </label>
                                        <div className="row">
                                            <CustomDatePicker
                                                field="hyvaksymisesitysLaadittu"
                                                className="tk-field form-control"
                                                id="hyvaksymisesitysLaadittu"
                                                dateFormat="D.M.YYYY"
                                                readOnly={!edit}
                                            />
                                        </div>
                                    </div>
                                </div>
                                <div className="col-sm-4">
                                    <div className="col-sm-12">
                                        <label
                                            htmlFor="hyvaksymisesitysSaapunut"
                                            className="row"
                                        >
                                            Hyväksymisesitys saapunut
                                            (pp.kk.vvvv)
                                        </label>
                                        <div className="row">
                                            <CustomDatePicker
                                                field="hyvaksymisesitysSaapunut"
                                                className="tk-field form-control"
                                                id="hyvaksymisesitysSaapunut"
                                                dateFormat="D.M.YYYY"
                                                readOnly={!edit}
                                            />
                                        </div>
                                    </div>
                                </div>
                                <div className="col-sm-4">
                                    <div className="col-sm-12">
                                        <label
                                            htmlFor="aloituskuulutus"
                                            className="row"
                                        >
                                            Aloituskuulutus (pp.kk.vvvv)
                                        </label>
                                        <div className="row">
                                            <CustomDatePicker
                                                field="aloituskuulutus"
                                                className="tk-field form-control"
                                                id="aloituskuulutus"
                                                dateFormat="D.M.YYYY"
                                                readOnly={!edit}
                                            />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </Collapse>

                        <Collapse header={"Kustannukset"} isOpened={true}>
                            <div className="form-group row">
                                <div className="col-sm-3">
                                    <div className="col-sm-12">
                                        <label
                                            htmlFor="kokonaiskustannukset"
                                            className="row"
                                        >
                                            Kokonaiskustannukset (€)
                                        </label>
                                        <div className="row">
                                            <CustomNumber
                                                field="kokonaiskustannukset"
                                                className="tk-field form-control"
                                                id="kokonaiskustannukset"
                                                placeholder=""
                                                readOnly={!edit}
                                            />
                                        </div>
                                    </div>
                                </div>
                                <div className="col-sm-3">
                                    <div className="col-sm-12">
                                        <label
                                            htmlFor="kustannuksetValtio"
                                            className="row"
                                        >
                                            Valtio (€)
                                        </label>
                                        <div className="row">
                                            <CustomNumber
                                                field="kustannuksetValtio"
                                                className="tk-field form-control"
                                                id="kustannuksetValtio"
                                                placeholder=""
                                                readOnly={!edit}
                                            />
                                        </div>
                                    </div>
                                </div>
                                <div className="col-sm-3">
                                    <div className="col-sm-12">
                                        <label
                                            htmlFor="kustannuksetKunta"
                                            className="row"
                                        >
                                            Kunta (€)
                                        </label>
                                        <div className="row">
                                            <CustomNumber
                                                field="kustannuksetKunta"
                                                className="tk-field form-control"
                                                id="kustannuksetKunta"
                                                placeholder=""
                                                readOnly={!edit}
                                            />
                                        </div>
                                    </div>
                                </div>
                                <div className="col-sm-3">
                                    <div className="col-sm-12">
                                        <label
                                            htmlFor="kustannuksetMuut"
                                            className="row"
                                        >
                                            Muut (€)
                                        </label>
                                        <div className="row">
                                            <CustomNumber
                                                field="kustannuksetMuut"
                                                className="tk-field form-control"
                                                id="kustannuksetMuut"
                                                placeholder=""
                                                readOnly={!edit}
                                            />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div className="form-group row">
                                <div className="col-sm-4">
                                    <div className="col-sm-12">
                                        <label
                                            htmlFor="kustannuksetSahko"
                                            className="row"
                                        >
                                            Sähkö (€)
                                        </label>
                                        <div className="row">
                                            <CustomNumber
                                                field="kustannuksetSahko"
                                                className="tk-field form-control"
                                                id="kustannuksetSahko"
                                                placeholder=""
                                                readOnly={!edit}
                                            />
                                        </div>
                                    </div>
                                </div>
                                <div className="col-sm-4">
                                    <div className="col-sm-12">
                                        <label
                                            htmlFor="kustannuksetViestinta"
                                            className="row"
                                        >
                                            Viestintä (€)
                                        </label>
                                        <div className="row">
                                            <CustomNumber
                                                field="kustannuksetViestinta"
                                                className="tk-field form-control"
                                                id="kustannuksetViestinta"
                                                placeholder=""
                                                readOnly={!edit}
                                            />
                                        </div>
                                    </div>
                                </div>
                                <div className="col-sm-4">
                                    <div className="col-sm-12">
                                        <label
                                            htmlFor="kustannuksetVesi"
                                            className="row"
                                        >
                                            Vesi (€)
                                        </label>
                                        <div className="row">
                                            <CustomNumber
                                                field="kustannuksetVesi"
                                                className="tk-field form-control"
                                                id="kustannuksetVesi"
                                                placeholder=""
                                                readOnly={!edit}
                                            />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div className="form-group row">
                                <div className="col-sm-6">
                                    <div className="col-sm-12">
                                        <label
                                            htmlFor="indeksiVuosi"
                                            className="row"
                                        >
                                            Indeksivuosiluku
                                        </label>
                                        <div className="row">
                                            <Text
                                                field="indeksiVuosi"
                                                type="number"
                                                lang="fi-FI"
                                                className="tk-field form-control"
                                                id="indeksiVuosi"
                                                placeholder=""
                                                readOnly={!edit}
                                            />
                                        </div>
                                    </div>
                                </div>
                                <div className="col-sm-6">
                                    <div className="col-sm-12">
                                        <label
                                            htmlFor="maarakennusIndeksi"
                                            className="row"
                                        >
                                            Maanrakennusindeksi
                                        </label>
                                        <div className="row">
                                            <Text
                                                field="maarakennusIndeksi"
                                                type="number"
                                                lang="fi-FI"
                                                className="tk-field form-control"
                                                id="maarakennusIndeksi"
                                                placeholder=""
                                                readOnly={!edit}
                                            />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </Collapse>
                        <Collapse header={"Kohteen tiedot"} isOpened={true}>
                            <div className="form-group row">
                                <div className="col-sm-4">
                                    <div className="col-sm-12">
                                        <label
                                            htmlFor="sisaltaaLakkaamisen"
                                            className="row"
                                        >
                                            Sisältää radan lakkaamisen
                                        </label>
                                        <div className="row">
                                            <RadioGroup
                                                id="sisaltaaLakkaamisen"
                                                className="tk-field form-control"
                                                readOnly={!edit}
                                                field="sisaltaaLakkaamisen"
                                            >
                                                {group => (
                                                    <div className="row">
                                                        <div className="col-xs-6 col-md-6 col-lg-2 nowrap">
                                                            <Radio
                                                                group={group}
                                                                value={"1"}
                                                                disabled={!edit}
                                                            />
                                                            &nbsp;
                                                            <span>Kyllä</span>
                                                        </div>
                                                        <div className="col-xs-6 col-md-6 col-lg-2 nowrap">
                                                            <Radio
                                                                group={group}
                                                                value={"0"}
                                                                disabled={!edit}
                                                            />
                                                            &nbsp;
                                                            <span>Ei</span>
                                                        </div>
                                                    </div>
                                                )}
                                            </RadioGroup>
                                        </div>
                                    </div>
                                </div>
                                <div className="col-sm-4">
                                    <div className="col-sm-12">
                                        <label
                                            htmlFor="kiirellinenKasittelyPyydetty"
                                            className="row"
                                        >
                                            Kiireellinen käsittely pyydetty
                                        </label>
                                        <div className="row">
                                            <RadioGroup
                                                id="kiirellinenKasittelyPyydetty"
                                                className="tk-field form-control"
                                                readOnly={!edit}
                                                field="kiirellinenKasittelyPyydetty"
                                            >
                                                {group => (
                                                    <div className="row">
                                                        <div className="col-xs-6 col-md-6 col-lg-2 nowrap">
                                                            <Radio
                                                                group={group}
                                                                value={"1"}
                                                                disabled={!edit}
                                                            />
                                                            &nbsp;
                                                            <span>Kyllä</span>
                                                        </div>
                                                        <div className="col-xs-6 col-md-6 col-lg-2 nowrap">
                                                            <Radio
                                                                group={group}
                                                                value={"0"}
                                                                disabled={!edit}
                                                            />
                                                            &nbsp;
                                                            <span>Ei</span>
                                                        </div>
                                                    </div>
                                                )}
                                            </RadioGroup>
                                        </div>
                                    </div>
                                </div>
                                <div className="col-sm-4">
                                    <div className="col-sm-12">
                                        <label
                                            htmlFor="sisaltaaTieSuunnittelua"
                                            className="row"
                                        >
                                            Sisältää tiesuunnittelua
                                        </label>
                                        <div className="row">
                                            <RadioGroup
                                                id="sisaltaaTieSuunnittelua"
                                                className="tk-field form-control"
                                                readOnly={!edit}
                                                field="sisaltaaTieSuunnittelua"
                                            >
                                                {group => (
                                                    <div className="row">
                                                        <div className="col-xs-6 col-md-6 col-lg-2 nowrap">
                                                            <Radio
                                                                group={group}
                                                                value={"1"}
                                                                disabled={!edit}
                                                            />
                                                            &nbsp;
                                                            <span>Kyllä</span>
                                                        </div>
                                                        <div className="col-xs-6 col-md-6 col-lg-2 nowrap">
                                                            <Radio
                                                                group={group}
                                                                value={"0"}
                                                                disabled={!edit}
                                                            />
                                                            &nbsp;
                                                            <span>Ei</span>
                                                        </div>
                                                    </div>
                                                )}
                                            </RadioGroup>
                                        </div>
                                    </div>
                                </div>
                                <div className="col-sm-4">
                                    <div className="col-sm-12">
                                        <label
                                            htmlFor="muistutuksia"
                                            className="row"
                                        >
                                            Muistutusten lkm
                                        </label>
                                        <div className="row">
                                            <Text
                                                field="muistutuksia"
                                                type="number"
                                                lang="fi-FI"
                                                className="tk-field form-control"
                                                id="muistutuksia"
                                                placeholder=""
                                                readOnly={!edit}
                                            />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div className="form-group row">
                                <div className="col-sm-6">
                                    <div className="col-sm-12">
                                        <label htmlFor="kohde1" className="row">
                                            Kohde 1
                                        </label>
                                        <div className="row">
                                            <Select
                                                field="kohde1"
                                                className="tk-field form-control"
                                                id="kohde1"
                                                placeholder=""
                                                readOnly={!edit}
                                                resources={resources}
                                                optionsReady={true}
                                                noResultsText="Ei tuloksia"
                                            />
                                        </div>
                                    </div>
                                </div>
                                <div className="col-sm-6">
                                    <div className="col-sm-12">
                                        <label htmlFor="kohde2" className="row">
                                            Kohde 2
                                        </label>
                                        <div className="row">
                                            <Select
                                                field="kohde2"
                                                className="tk-field form-control"
                                                id="kohde2"
                                                placeholder=""
                                                readOnly={!edit}
                                                resources={resources}
                                                optionsReady={true}
                                                noResultsText="Ei tuloksia"
                                            />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </Collapse>

                        <Collapse
                            header={"Käsittelyn eteneminen"}
                            isOpened={true}
                        >
                            <div className="form-group row">
                                <div className="col-sm-12">
                                    <div className="col-sm-12">
                                        <label
                                            htmlFor="selitys"
                                            className="row"
                                        >
                                            Selitys
                                        </label>
                                        <div className="row">
                                            <TextArea
                                                field="selitys"
                                                type="text"
                                                className="tk-field form-control"
                                                id="selitys"
                                                rows="3"
                                                placeholder=""
                                                readOnly={!edit}
                                            />
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div className="form-group row">
                                <div className="col-sm-6">
                                    <div className="col-sm-12">
                                        <label
                                            htmlFor="hyvaksymispaatosAnnettu"
                                            className="row"
                                        >
                                            Hyväksymispäätös annettu
                                            (pp.kk.vvvv)
                                        </label>
                                        <div className="row">
                                            <CustomDatePicker
                                                field="hyvaksymispaatosAnnettu"
                                                className="tk-field form-control"
                                                id="hyvaksymispaatosAnnettu"
                                                dateFormat="D.M.YYYY"
                                                readOnly={!edit}
                                            />
                                        </div>
                                    </div>
                                </div>
                                <div className="col-sm-6">
                                    <div className="col-sm-12">
                                        <label
                                            htmlFor="palautettuElylle"
                                            className="row"
                                        >
                                            Palautettu ELY:lle (pp.kk.vvvv)
                                        </label>
                                        <div className="row">
                                            <CustomDatePicker
                                                field="palautettuElylle"
                                                className="tk-field form-control"
                                                id="palautettuElylle"
                                                dateFormat="D.M.YYYY"
                                                readOnly={!edit}
                                            />
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div className="form-group row">
                                <div className="col-sm-6">
                                    <div className="col-sm-12">
                                        <label
                                            htmlFor="jatkopaatosAnnettu1"
                                            className="row"
                                        >
                                            1. jatkopäätös annettu (pp.kk.vvvv)
                                        </label>
                                        <div className="row">
                                            <CustomDatePicker
                                                field="jatkopaatosAnnettu1"
                                                className="tk-field form-control"
                                                id="jatkopaatosAnnettu1"
                                                dateFormat="D.M.YYYY"
                                                readOnly={!edit}
                                            />
                                        </div>
                                    </div>
                                </div>
                                <div className="col-sm-6">
                                    <div className="col-sm-12">
                                        <label
                                            htmlFor="jatkopaatosAnnettu2"
                                            className="row"
                                        >
                                            2. jatkopäätös annettu (pp.kk.vvvv)
                                        </label>
                                        <div className="row">
                                            <CustomDatePicker
                                                field="jatkopaatosAnnettu2"
                                                className="tk-field form-control"
                                                id="jatkopaatosAnnettu2"
                                                dateFormat="D.M.YYYY"
                                                readOnly={!edit}
                                            />
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div className="form-group row">
                                <div className="col-sm-6">
                                    <div className="col-sm-12">
                                        <label
                                            htmlFor="hyvaksymisesitysLvmLaadittu"
                                            className="row"
                                        >
                                            Hyväksymisesitys LVM:lle laadittu
                                            (pp.kk.vvvv)
                                        </label>
                                        <div className="row">
                                            <CustomDatePicker
                                                field="hyvaksymisesitysLvmLaadittu"
                                                className="tk-field form-control"
                                                id="hyvaksymisesitysLvmLaadittu"
                                                dateFormat="D.M.YYYY"
                                                readOnly={!edit}
                                            />
                                        </div>
                                    </div>
                                </div>
                                <div className="col-sm-6">
                                    <div className="col-sm-12">
                                        <label
                                            htmlFor="hyvaksymispaatosLvmAnnettu"
                                            className="row"
                                        >
                                            LVM:n hyväksymispäätös annettu
                                            (pp.kk.vvvv)
                                        </label>
                                        <div className="row">
                                            <CustomDatePicker
                                                field="hyvaksymispaatosLvmAnnettu"
                                                className="tk-field form-control"
                                                id="hyvaksymispaatosLvmAnnettu"
                                                dateFormat="D.M.YYYY"
                                                readOnly={!edit}
                                            />
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div className="form-group row">
                                <div className="col-sm-6">
                                    <div className="col-sm-12">
                                        <label
                                            htmlFor="jatkopaatosLvmAnnettu"
                                            className="row"
                                        >
                                            LVM:n jatkopäätös annettu
                                            (pp.kk.vvvv)
                                        </label>
                                        <div className="row">
                                            <CustomDatePicker
                                                field="jatkopaatosLvmAnnettu"
                                                className="tk-field form-control"
                                                id="jatkopaatosLvmAnnettu"
                                                dateFormat="D.M.YYYY"
                                                readOnly={!edit}
                                            />
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div className="form-group row">
                                <div className="col-sm-6">
                                    <div className="col-sm-12">
                                        <label
                                            htmlFor="osapaatosAnnettu"
                                            className="row"
                                        >
                                            Osapäätös annettu (pp.kk.vvvv)
                                        </label>
                                        <div className="row">
                                            <CustomDatePicker
                                                field="osapaatosAnnettu"
                                                className="tk-field form-control"
                                                id="osapaatosAnnettu"
                                                dateFormat="D.M.YYYY"
                                                readOnly={!edit}
                                            />
                                        </div>
                                    </div>
                                </div>
                                <div className="col-sm-6">
                                    <div className="col-sm-12">
                                        <label
                                            htmlFor="valituksia"
                                            className="row"
                                        >
                                            Valitusten lkm
                                        </label>
                                        <div className="row">
                                            <Text
                                                field="valituksia"
                                                type="number"
                                                lang="fi-FI"
                                                className="tk-field form-control"
                                                id="valituksia"
                                                placeholder=""
                                                readOnly={!edit}
                                            />
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div className="form-group row">
                                <div className="col-sm-6">
                                    <div className="col-sm-12">
                                        <label
                                            htmlFor="valiapaatosHao"
                                            className="row"
                                        >
                                            HAO:n välipäätös
                                        </label>
                                        <div className="row">
                                            <Text
                                                field="valiapaatosHao"
                                                type="text"
                                                className="tk-field form-control"
                                                id="valiapaatosHao"
                                                placeholder=""
                                                readOnly={!edit}
                                            />
                                        </div>
                                    </div>
                                </div>
                                <div className="col-sm-6">
                                    <div className="col-sm-12">
                                        <label
                                            htmlFor="valiPaatosHaoSisalto"
                                            className="row"
                                        >
                                            HAO:n välipäätöksen sisältö
                                        </label>
                                        <div className="row">
                                            <TextArea
                                                rows="3"
                                                field="valiPaatosHaoSisalto"
                                                type="text"
                                                className="tk-field form-control"
                                                id="valiPaatosHaoSisalto"
                                                placeholder=""
                                                readOnly={!edit}
                                            />
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div className="form-group row">
                                <div className="col-sm-6">
                                    <div className="col-sm-12">
                                        <label
                                            htmlFor="hyvaksymispaatosHaoKumottu"
                                            className="row"
                                        >
                                            Hyväksymispäätös kumottu
                                        </label>
                                        <div className="row">
                                            <RadioGroup
                                                id="hyvaksymispaatosHaoKumottu"
                                                className="tk-field form-control"
                                                readOnly={!edit}
                                                field="hyvaksymispaatosHaoKumottu"
                                            >
                                                {group => (
                                                    <div className="row">
                                                        <div className="col-xs-6 col-md-6 col-lg-2 nowrap">
                                                            <Radio
                                                                group={group}
                                                                value={"1"}
                                                                disabled={!edit}
                                                            />
                                                            &nbsp;
                                                            <span>Kyllä</span>
                                                        </div>
                                                        <div className="col-xs-6 col-md-6 col-lg-2 nowrap">
                                                            <Radio
                                                                group={group}
                                                                value={"0"}
                                                                disabled={!edit}
                                                            />
                                                            &nbsp;
                                                            <span>Ei</span>
                                                        </div>
                                                    </div>
                                                )}
                                            </RadioGroup>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div className="form-group row">
                                <div className="col-sm-6">
                                    <div className="col-sm-12">
                                        <label
                                            htmlFor="paatosHao"
                                            className="row"
                                        >
                                            HAO:n päätös (pp.kk.vvvv)
                                        </label>
                                        <div className="row">
                                            <CustomDatePicker
                                                field="paatosHao"
                                                className="tk-field form-control"
                                                id="paatosHao"
                                                dateFormat="D.M.YYYY"
                                                readOnly={!edit}
                                            />
                                        </div>
                                    </div>
                                </div>
                                <div className="col-sm-6">
                                    <div className="col-sm-12">
                                        <label
                                            htmlFor="paatosHaoSisalto"
                                            className="row"
                                        >
                                            HAO:n päätöksen sisältö
                                        </label>
                                        <div className="row">
                                            <TextArea
                                                field="paatosHaoSisalto"
                                                type="text"
                                                className="tk-field form-control"
                                                id="paatosHaoSisalto"
                                                rows="3"
                                                placeholder=""
                                                readOnly={!edit}
                                            />
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div className="form-group row">
                                <div className="col-sm-6">
                                    <div className="col-sm-12">
                                        <label
                                            htmlFor="valiapaatosKho"
                                            className="row"
                                        >
                                            KHO:n välipäätös
                                        </label>
                                        <div className="row">
                                            <Text
                                                field="valiapaatosKho"
                                                type="text"
                                                className="tk-field form-control"
                                                id="valiapaatosKho"
                                                placeholder=""
                                                readOnly={!edit}
                                            />
                                        </div>
                                    </div>
                                </div>
                                <div className="col-sm-6">
                                    <div className="col-sm-12">
                                        <label
                                            htmlFor="valiPaatosKhoSisalto"
                                            className="row"
                                        >
                                            KHO:n välipäätöksen sisältö
                                        </label>
                                        <div className="row">
                                            <TextArea
                                                rows="3"
                                                field="valiPaatosKhoSisalto"
                                                type="text"
                                                className="tk-field form-control"
                                                id="valiPaatosKhoSisalto"
                                                placeholder=""
                                                readOnly={!edit}
                                            />
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div className="form-group row">
                                <div className="col-sm-6">
                                    <div className="col-sm-12">
                                        <label
                                            htmlFor="hyvaksymispaatosKhoKumottu"
                                            className="row"
                                        >
                                            Hyväksymispäätös kumottu
                                        </label>
                                        <div className="row">
                                            <RadioGroup
                                                id="hyvaksymispaatosKhoKumottu"
                                                className="tk-field form-control"
                                                readOnly={!edit}
                                                field="hyvaksymispaatosKhoKumottu"
                                            >
                                                {group => (
                                                    <div className="row">
                                                        <div className="col-xs-6 col-md-6 col-lg-2 nowrap">
                                                            <Radio
                                                                group={group}
                                                                value={"1"}
                                                                disabled={!edit}
                                                            />
                                                            &nbsp;
                                                            <span>Kyllä</span>
                                                        </div>
                                                        <div className="col-xs-6 col-md-6 col-lg-2 nowrap">
                                                            <Radio
                                                                group={group}
                                                                value={"0"}
                                                                disabled={!edit}
                                                            />
                                                            &nbsp;
                                                            <span>Ei</span>
                                                        </div>
                                                    </div>
                                                )}
                                            </RadioGroup>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div className="form-group row">
                                <div className="col-sm-6">
                                    <div className="col-sm-12">
                                        <label
                                            htmlFor="paatosKho"
                                            className="row"
                                        >
                                            KHO:n päätös (pp.kk.vvvv)
                                        </label>
                                        <div className="row">
                                            <CustomDatePicker
                                                field="paatosKho"
                                                className="tk-field form-control"
                                                id="paatosKho"
                                                dateFormat="D.M.YYYY"
                                                readOnly={!edit}
                                            />
                                        </div>
                                    </div>
                                </div>
                                <div className="col-sm-6">
                                    <div className="col-sm-12">
                                        <label
                                            htmlFor="paatosKhoSisalto"
                                            className="row"
                                        >
                                            KHO:n päätöksen sisältö
                                        </label>
                                        <div className="row">
                                            <TextArea
                                                field="paatosKhoSisalto"
                                                type="text"
                                                className="tk-field form-control"
                                                id="paatosKhoSisalto"
                                                rows="3"
                                                placeholder=""
                                                readOnly={!edit}
                                            />
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div className="form-group row">
                                <div className="col-sm-6">
                                    <div className="col-sm-12">
                                        <label
                                            htmlFor="lainvoimaisuus"
                                            className="row"
                                        >
                                            Lainvoimaisuus (pp.kk.vvvv)
                                        </label>
                                        <div className="row">
                                            <CustomDatePicker
                                                field="lainvoimaisuus"
                                                className="tk-field form-control"
                                                id="lainvoimaisuus"
                                                dateFormat="D.M.YYYY"
                                                readOnly={!edit}
                                            />
                                        </div>
                                    </div>
                                </div>
                                <div className="col-sm-6">
                                    <div className="col-sm-12">
                                        <label
                                            htmlFor="lainvoimaisuudenPaattyminen"
                                            className="row"
                                        >
                                            Lainvoimaisuuden päättyminen
                                            (pp.kk.vvvv)
                                        </label>
                                        <div className="row">
                                            <CustomDatePicker
                                                field="lainvoimaisuudenPaattyminen"
                                                className="tk-field form-control"
                                                id="lainvoimaisuudenPaattyminen"
                                                dateFormat="D.M.YYYY"
                                                readOnly={!edit}
                                            />
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div className="form-group row">
                                <div className="col-sm-6">
                                    <div className="col-sm-12">
                                        <label
                                            htmlFor="rauennut"
                                            className="row"
                                        >
                                            Rauennut
                                        </label>
                                        <div className="row">
                                            <Text
                                                field="rauennut"
                                                type="text"
                                                className="tk-field form-control"
                                                id="rauennut"
                                                placeholder=""
                                                readOnly={!edit}
                                            />
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div className="form-group row">
                                <div className="col-sm-6">
                                    <div className="col-sm-12">
                                        <label
                                            htmlFor="ratatoimitusTehty"
                                            className="row"
                                        >
                                            Rautatietoimitus käynnistynyt
                                            (pp.kk.vvvv)
                                        </label>
                                        <div className="row">
                                            <CustomDatePicker
                                                field="ratatoimitusTehty"
                                                className="tk-field form-control"
                                                id="ratatoimitusTehty"
                                                dateFormat="D.M.YYYY"
                                                readOnly={!edit}
                                            />
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div className="form-group row">
                                <div className="col-sm-6">
                                    <div className="col-sm-12">
                                        <label
                                            htmlFor="kayttoonottoLuovutusOsa"
                                            className="row"
                                        >
                                            Käyttöönottoluovutus, osaluovutus
                                            (pp.kk.vvvv)
                                        </label>
                                        <div className="row">
                                            <CustomDatePicker
                                                field="kayttoonottoLuovutusOsa"
                                                className="tk-field form-control"
                                                id="kayttoonottoLuovutusOsa"
                                                dateFormat="D.M.YYYY"
                                                readOnly={!edit}
                                            />
                                        </div>
                                    </div>
                                </div>
                                <div className="col-sm-6">
                                    <div className="col-sm-12">
                                        <label
                                            htmlFor="kayttoonottoLuovutusKoko"
                                            className="row"
                                        >
                                            Käyttöönottoluovutus, kokoluovutus
                                            (pp.kk.vvvv)
                                        </label>
                                        <div className="row">
                                            <CustomDatePicker
                                                field="kayttoonottoLuovutusKoko"
                                                className="tk-field form-control"
                                                id="kayttoonottoLuovutusKoko"
                                                dateFormat="D.M.YYYY"
                                                readOnly={!edit}
                                            />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </Collapse>
                        <FormControls
                            edit={edit}
                            values={formApi.values}
                            setEditable={setEditable}
                            submitForm={formApi.submitForm}
                            resetForm={formApi.resetAll}
                            cancelNew={cancelNew}
                            remove={remove}
                        />
                    </form>
                )}
            </Form>
        );
    }
}
