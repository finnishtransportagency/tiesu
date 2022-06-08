import { types } from "mobx-state-tree";

import { createModel, createCollectionType } from "./Models";

export const kohdeEnum = [
    "Kaksoisraide",
    "Ratapiha",
    "Liikennepaikka",
    "Kolmioraide",
    "Tasoristeys",
    "Sähköistys",
    "Radan lakkauttaminen",
    "Nopeuden nosti",
    "Akselipainon nosto"
];

export const suunnitelmanStatusEnum = [
    "Suunnitelma käynnissä",
    "Hyväksymisesitys käsittelyssä",
    "Hyväksymispäätös annettu / odottaa kuulutustod. lainv.päätöstä",
    "Hyväksymispäätös lainvoimainen",
    "Rakentaminen käynnissä",
    "Luovutettu liikenteelle osittain",
    "Luovutettu liikenteelle kokonaan",
    "Valitus",
    "LVM:n hyväksymispäätös",
    "Rauennut"
];

export const RautatienYleisSuunnitelma = types.compose(
    createModel("RautatienYleisSuunnitelma"),
    types
        .model("RautatienYleisSuunnitelma", {
            nimi: types.maybe(types.string, null),
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
            sisaltaaLakkaamisen: types.maybe(types.number, null),
            kiirellinenKasittelyPyydetty: types.maybe(types.number, null),
            muistutuksia: types.maybe(types.number, null),
            kohde1: types.maybe(types.number, null),
            kohde2: types.maybe(types.number, null),
            kohde3: types.maybe(types.number, null),
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
            rauennut: types.maybe(types.string, null),
            suunnitelmaLaadittu: types.maybe(types.string, null),
            projektipaallikko: types.maybe(types.string, null)
        })
        .actions(self => ({}))
);

export const RautatienYleisSuunnitelmaStore = types.compose(
    "RautatienYleisSuunnitelmaStore",
    createCollectionType(
        "rautatienyleissuunnitelmat",
        RautatienYleisSuunnitelma,
        "RautatienYleisSuunnitelma"
    ),
    types
        .model("RautatienYleisSuunnitelmaStore", {})
        .views(self => ({}))
        .actions(self => ({}))
);
