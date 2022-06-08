package fi.liike.rest.api.dto;

import fi.liike.rest.Model.Haettava;
import fi.liike.rest.Model.Tiesuunnitelma;
import fi.liike.rest.api.ContentDto;
import fi.liike.rest.util.Utils;

public class TiesuunnitelmaConverter implements Converter {

	public TiesuunnitelmaConverter() {
	}

	@Override
	public Haettava dtoToDomain(ContentDto dtoContent) {
		TiesuunnitelmaDto data = (TiesuunnitelmaDto) dtoContent;
		Tiesuunnitelma result = new Tiesuunnitelma();
		result.setTunnus(data.getTunnus());
		result.setNimi(data.getNimi());
		
		result.setKasittelija(data.getKasittelija());
		result.setKuvaus(data.getKuvaus());
		result.setYvaHanke(data.getYvaHanke());
		result.setAsianumero(data.getAsianumero());
		result.setElyKeskus(data.getElyKeskus());
		result.setSuunnitelmanStatus(data.getSuunnitelmanStatus());
		result.setHyvaksymisesitysLaadittu(Utils.strToDate(data.getHyvaksymisesitysLaadittu()));
		result.setHyvaksymisesitysSaapunut(Utils.strToDate(data.getHyvaksymisesitysSaapunut()));
		result.setAloituskuulutus(Utils.strToDate(data.getAloituskuulutus()));
		result.setKokonaiskustannukset(data.getKokonaiskustannukset());
		result.setKustannuksetValtio(data.getKustannuksetValtio());
		result.setKustannuksetKunta(data.getKustannuksetKunta());
		result.setKustannuksetSahko(data.getKustannuksetSahko());
		result.setKustannuksetViestinta(data.getKustannuksetViestinta());
		result.setKustannuksetVesi(data.getKustannuksetVesi());
		result.setKustannuksetMuut(data.getKustannuksetMuut());
		result.setIndeksiVuosi(data.getIndeksiVuosi());
		result.setMaarakennusIndeksi(data.getMaarakennusIndeksi());
		result.setSisaltaaMaantienLakkaamisen(data.getSisaltaaMaantienLakkaamisen());
		result.setKiirellinenKasittelyPyydetty(data.getKiirellinenKasittelyPyydetty());
		result.setMuistutuksia(data.getMuistutuksia());
		result.setKohde1(data.getKohde1());
		result.setKohde2(data.getKohde2());
		result.setSelitys(data.getSelitys());
		result.setHyvaksymispaatosAnnettu(Utils.strToDate(data.getHyvaksymispaatosAnnettu()));
		result.setJatkopaatosAnnettu1(Utils.strToDate(data.getJatkopaatosAnnettu1()));
		result.setJatkopaatosAnnettu2(Utils.strToDate(data.getJatkopaatosAnnettu2()));
		result.setPalautettuElylle(Utils.strToDate(data.getPalautettuElylle()));
		result.setHyvaksymisesitysLvmLaadittu(Utils.strToDate(data.getHyvaksymisesitysLvmLaadittu()));
		result.setHyvaksymispaatosLvmAnnettu(Utils.strToDate(data.getHyvaksymispaatosLvmAnnettu()));
		result.setJatkopaatosLvmAnnettu(Utils.strToDate(data.getJatkopaatosLvmAnnettu()));
		result.setOsapaatosAnnettu(Utils.strToDate(data.getOsapaatosAnnettu()));
		result.setValituksia(data.getValituksia());
		result.setValiapaatosHao(data.getValiapaatosHao());
		result.setHyvaksymispaatosHaoKumottu(data.getHyvaksymispaatosHaoKumottu());
		result.setPaatosHao(Utils.strToDate(data.getPaatosHao()));
		result.setPaatosHaoSisalto(data.getPaatosHaoSisalto());
		result.setValiapaatosKho(data.getValiapaatosKho());
		result.setHyvaksymispaatosKhoKumottu(data.getHyvaksymispaatosKhoKumottu());
		result.setPaatosKho(Utils.strToDate(data.getPaatosKho()));
		result.setPaatosKhoSisalto(data.getPaatosKhoSisalto());
		result.setValiPaatosKhoSisalto(data.getValiPaatosKhoSisalto());
		result.setValiPaatosHaoSisalto(data.getValiPaatosHaoSisalto());
		result.setLainvoimaisuus(Utils.strToDate(data.getLainvoimaisuus()));
		result.setLainvoimaisuudenPaattyminen(Utils.strToDate(data.getLainvoimaisuudenPaattyminen()));
		result.setRauennut(Utils.strToDate(data.getRauennut()));
		result.setLiikenteeseenOsaLuovutus(Utils.strToDate(data.getLiikenteeseenOsaLuovutus()));
		result.setLiikenteeseenKokoLuovutus(Utils.strToDate(data.getLiikenteeseenKokoLuovutus()));
		result.setMaantietoimitusTehty(Utils.strToDate(data.getMaantietoimitusTehty()));

		result.setSisaltaaRataSuunnittelua(data.getSisaltaaRataSuunnittelua());

		result.setRivimuokkaajatunnus(data.getRivimuokkaajatunnus());
		return result;
	}

	@Override
	public ContentDto modelToDto(Haettava modelObject, Integer... parentId) {
		if (modelObject == null)
			return null;
		Tiesuunnitelma data = (Tiesuunnitelma) modelObject;
		TiesuunnitelmaDto result = new TiesuunnitelmaDto();
		result.setTunnus(data.getTunnus());
		result.setNimi(data.getNimi());
		
		result.setKasittelija(data.getKasittelija());
		result.setKuvaus(data.getKuvaus());
		result.setYvaHanke(data.getYvaHanke());
		result.setAsianumero(data.getAsianumero());
		result.setElyKeskus(data.getElyKeskus());
		result.setSuunnitelmanStatus(data.getSuunnitelmanStatus());
		result.setHyvaksymisesitysLaadittu(Utils.dateToStr(data.getHyvaksymisesitysLaadittu()));
		result.setHyvaksymisesitysSaapunut(Utils.dateToStr(data.getHyvaksymisesitysSaapunut()));
		result.setAloituskuulutus(Utils.dateToStr(data.getAloituskuulutus()));
		result.setKokonaiskustannukset(data.getKokonaiskustannukset());
		result.setKustannuksetValtio(data.getKustannuksetValtio());
		result.setKustannuksetKunta(data.getKustannuksetKunta());
		result.setKustannuksetSahko(data.getKustannuksetSahko());
		result.setKustannuksetViestinta(data.getKustannuksetViestinta());
		result.setKustannuksetVesi(data.getKustannuksetVesi());
		result.setKustannuksetMuut(data.getKustannuksetMuut());
		result.setIndeksiVuosi(data.getIndeksiVuosi());
		result.setMaarakennusIndeksi(data.getMaarakennusIndeksi());
		result.setSisaltaaMaantienLakkaamisen(data.getSisaltaaMaantienLakkaamisen());
		result.setKiirellinenKasittelyPyydetty(data.getKiirellinenKasittelyPyydetty());
		result.setMuistutuksia(data.getMuistutuksia());
		result.setKohde1(data.getKohde1());
		result.setKohde2(data.getKohde2());
		result.setSelitys(data.getSelitys());
		result.setHyvaksymispaatosAnnettu(Utils.dateToStr(data.getHyvaksymispaatosAnnettu()));
		result.setJatkopaatosAnnettu1(Utils.dateToStr(data.getJatkopaatosAnnettu1()));
		result.setJatkopaatosAnnettu2(Utils.dateToStr(data.getJatkopaatosAnnettu2()));
		result.setPalautettuElylle(Utils.dateToStr(data.getPalautettuElylle()));
		result.setHyvaksymisesitysLvmLaadittu(Utils.dateToStr(data.getHyvaksymisesitysLvmLaadittu()));
		result.setHyvaksymispaatosLvmAnnettu(Utils.dateToStr(data.getHyvaksymispaatosLvmAnnettu()));
		result.setJatkopaatosLvmAnnettu(Utils.dateToStr(data.getJatkopaatosLvmAnnettu()));
		result.setOsapaatosAnnettu(Utils.dateToStr(data.getOsapaatosAnnettu()));
		result.setValituksia(data.getValituksia());
		result.setValiapaatosHao(data.getValiapaatosHao());
		result.setHyvaksymispaatosHaoKumottu(data.getHyvaksymispaatosHaoKumottu());
		result.setPaatosHao(Utils.dateToStr(data.getPaatosHao()));
		result.setPaatosHaoSisalto(data.getPaatosHaoSisalto());
		result.setValiapaatosKho(data.getValiapaatosKho());
		result.setHyvaksymispaatosKhoKumottu(data.getHyvaksymispaatosKhoKumottu());
		result.setPaatosKho(Utils.dateToStr(data.getPaatosKho()));
		result.setPaatosKhoSisalto(data.getPaatosKhoSisalto());
		result.setValiPaatosKhoSisalto(data.getValiPaatosKhoSisalto());
		result.setValiPaatosHaoSisalto(data.getValiPaatosHaoSisalto());
		result.setLainvoimaisuus(Utils.dateToStr(data.getLainvoimaisuus()));
		result.setLainvoimaisuudenPaattyminen(Utils.dateToStr(data.getLainvoimaisuudenPaattyminen()));
		result.setRauennut(Utils.dateToStr(data.getRauennut()));
		result.setLiikenteeseenOsaLuovutus(Utils.dateToStr(data.getLiikenteeseenOsaLuovutus()));
		result.setLiikenteeseenKokoLuovutus(Utils.dateToStr(data.getLiikenteeseenKokoLuovutus()));
		result.setSisaltaaRataSuunnittelua(data.getSisaltaaRataSuunnittelua());
		result.setMaantietoimitusTehty(Utils.dateToStr(data.getMaantietoimitusTehty()));


		return result;
	}
}
