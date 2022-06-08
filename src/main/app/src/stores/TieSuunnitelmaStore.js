import { types } from "mobx-state-tree";

import { createModel, createCollectionType } from "./Models";

export const kohdeRes = [
    { id: 5, label: "Moottoritie tai moottoriliikennetie" },
    { id: 4, label: "Maantie" },
    { id: 9, label: "Eritasoliittymä" },
    { id: 7, label: "Tasoliittymä" },
    { id: 6, label: "Ohituskaista" },
    { id: 1, label: "Jalkakäytävä ja pyörätie" },
    { id: 2, label: "Yksityisen tien liittymä tai järjestely" },
    { id: 11, label: "Siltapaikka" },
    { id: 12, label: "Melusuojaus" },
    { id: 8, label: "Riista-aita" },
    { id: 13, label: "Maantien lakkautus" },
    { id: 10, label: "Muu" }
];

export const suunnitelmanStatusRes = [
    { id: 1, label: "Hyväksymisesitys saapunut, ei käsittelyssä" },
    { id: 2, label: "Hyväksymisesitys käsittelyssä" },
    { id: 3, label: "Hyväksymispäätös annettu / odottaa kuulutustod., lainv.päätöstä tms." },
    { id: 4, label: "Hyväksymispäätös annettu, lainvoimainen" },
    { id: 5, label: "Luovutettu liikenteelle osittain" },
    { id: 6, label: "Luovutettu liikenteelle kokonaan" },
    { id: 7, label: "Valitus" },
    { id: 8, label: "LVM:n hyväksymispäätös" },
    { id: 9, label: "Rauennut" },
    { id: 10, label: "Ei statusta", readonly: true },
    { id: 11, label: "Palautettu ELYlle" },
    { id: 12, label: "Suunnitelma käynnissä" },
    { id: 13, label: "Toteutuksessa / Osin toteutuksessa" }
];

export const Tiesuunnitelma = types.compose(
    createModel("Tiesuunnitelma"),
    types
        .model("Tiesuunnitelma", {
            nimi: types.maybe(types.string, null),
            kasittelija: types.maybe(types.string, null),
            kuvaus: types.maybe(types.string, null),
            asianumero: types.maybe(types.string, null),
            elyKeskus: types.maybe(types.string, null),
            suunnitelmanStatus: types.maybe(types.number, null),
            yvaHanke: types.maybe(types.number, null),
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
            sisaltaaRataSuunnittelua: types.maybe(types.number, null),
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
            lainvoimaisuus: types.maybe(types.string, null),
            lainvoimaisuudenPaattyminen: types.maybe(types.string, null),
            liikenteeseenOsaLuovutus: types.maybe(types.string, null), //vuosiluku
            liikenteeseenKokoLuovutus: types.maybe(types.string, null), //vuosiluku
            maantietoimitusTehty: types.maybe(types.string, null)
        })
        .actions(self => ({}))
);

export const TiesuunnitelmaStore = types.compose(
    "TiesuunnitelmaStore",
    createCollectionType("tiesuunnitelmat", Tiesuunnitelma, "Tiesuunnitelma"),
    types
        .model("TiesuunnitelmaStore", {})
        .views(self => ({}))
        .actions(self => ({}))
);
