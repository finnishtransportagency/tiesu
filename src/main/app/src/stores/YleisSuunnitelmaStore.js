import { types } from "mobx-state-tree";

import { createModel, createCollectionType } from "./Models";

// export const kohdeEnum = [
//     "moottoritie tai moottoriliikennetie",
//     "maantie",
//     "eritasoliittymä",
//     "tasoliittymä",
//     "ohituskaista",
//     "jalkakäytävä ja pyörätie",
//     "yksityisen tien liittymä tai järjestely",
//     "siltapaikka",
//     "melusuojaus",
//     "riista-aita",
//     "maantien lakkautus",
//     "muu"
// ];

export const yleisSuunnitelmaStatusRes = [
    { value: -1, label: "Ei statusta", disabled: true },
    { value:  1, label: "Hyväksymisesitys saapunut, ei käsittelyssä" },
    { value:  2, label: "Hyväksymisesitys käsittelyssä" },
    { value:  3, label: "Hyväksymispäätös annettu / odottaa kuulutustod., lainv. päätöstä" },
    { value:  4, label: "Valitus" },
    { value:  5, label: "Odottaa päätöstä, kuulutustodistusta, lisätietoja tms.", disabled: true},
    { value:  6, label: "Hyväksymispäätös annettu, lainvoimainen" },
    { value:  7, label: "LVM:n hyväksymispäätös" },
    { value:  8, label: "Rauennut" },
    { value:  9, label: "Palautettu ELYlle" }
];

export const Yleissuunnitelma = types.compose(
    createModel("Yleissuunnitelma"),
    types
        .model("Yleissuunnitelma", {
            nimi: types.maybe(types.string, null),
            kasittelija: types.maybe(types.string, null),
            kuvaus: types.maybe(types.string, null),
            yvaHanke: types.maybe(types.number, null),
            asianumero: types.maybe(types.string, null),
            elyKeskus: types.maybe(types.string, null),
            suunnitelmanStatus: types.maybe(types.number, null),
            hyvaksymisesitysLaadittu: types.maybe(types.string, null),
            hyvaksymisesitysSaapunut: types.maybe(types.string, null),
            aloituskuulutus: types.maybe(types.string, null),
            kokonaiskustannukset: types.maybe(types.number, null),
            kustannuksetValtio: types.maybe(types.number, null),
            kustannuksetKunta: types.maybe(types.number, null),
            kustannuksetSahko: types.maybe(types.number, null),
            kustannuksetViestinta: types.maybe(types.number, null),
            kustannuksetVesi: types.maybe(types.number, null),
            kustannuksetMuut: types.maybe(types.number, null),
            indeksiVuosi: types.maybe(types.number, null), //vuosiluku
            maarakennusIndeksi: types.maybe(types.number, null),
            sisaltaaMaantienLakkaamisen: types.maybe(types.number, null),
            kiirellinenKasittelyPyydetty: types.maybe(types.number, null),
            muistutuksia: types.maybe(types.number, null),
            kohde1: types.maybe(types.number, null),
            kohde2: types.maybe(types.number, null),
            selitys: types.maybe(types.string, null),
            hyvaksymispaatosAnnettu: types.maybe(types.string, null),
            jatkopaatosAnnettu1: types.maybe(types.string, null),
            jatkopaatosAnnettu2: types.maybe(types.string, null),
            palautettuElylle: types.maybe(types.string, null),
            hyvaksymisesitysLvmLaadittu: types.maybe(types.string, null),
            hyvaksymispaatosLvmAnnettu: types.maybe(types.string, null),
            jatkopaatosLvmAnnettu: types.maybe(types.string, null),
            osapaatosAnnettu: types.maybe(types.string, null),
            valituksia: types.maybe(types.number, null),
            valiapaatosHao: types.maybe(types.string, null),
            hyvaksymispaatosHaoKumottu: types.maybe(types.number, null),
            paatosHao: types.maybe(types.string, null),
            paatosHaoSisalto: types.maybe(types.string, null),
            valiapaatosKho: types.maybe(types.string, null),
            hyvaksymispaatosKhoKumottu: types.maybe(types.number, null),
            paatosKho: types.maybe(types.string, null),
            paatosKhoSisalto: types.maybe(types.string, null),
            valiPaatosKhoSisalto: types.maybe(types.string, null),
            valiPaatosHaoSisalto: types.maybe(types.string, null),
            suunnitelmaLaadittu: types.maybe(types.string, null),
            lainvoimaisuus: types.maybe(types.string, null),
            lainvoimaisuudenPaattyminen: types.maybe(types.string, null),
            rauennut: types.maybe(types.string, null)
        })
        .actions(self => ({}))
);

export const YleissuunnitelmaStore = types.compose(
    "YleissuunnitelmaStore",
    createCollectionType(
        "yleissuunnitelmat",
        Yleissuunnitelma,
        "Yleissuunnitelma"
    ),
    types
        .model("YleissuunnitelmaStore", {})
        .views(self => ({}))
        .actions(self => ({}))
);
