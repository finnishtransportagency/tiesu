package fi.liike.rest.api.dto;

import fi.liike.rest.Model.Haettava;
import fi.liike.rest.Model.RautatienYleissuunnitelma;
import fi.liike.rest.api.ContentDto;
import fi.liike.rest.util.Utils;

public class RautatienYleissuunnitelmaConverter implements Converter {

	public RautatienYleissuunnitelmaConverter() {
	}

	@Override
	public Haettava dtoToDomain(ContentDto dtoContent) {
		RautatienYleissuunnitelmaDto data = (RautatienYleissuunnitelmaDto) dtoContent;
		RautatienYleissuunnitelma result = new RautatienYleissuunnitelma();
		result.setTunnus(data.getTunnus());
		result.setNimi(data.getNimi());

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
		result.setSisaltaaLakkaamisen(data.getSisaltaaLakkaamisen());
		result.setKiirellinenKasittelyPyydetty(data.getKiirellinenKasittelyPyydetty());
		result.setMuistutuksia(data.getMuistutuksia());
		result.setKohde1(data.getKohde1());
		result.setKohde2(data.getKohde2());
		result.setKohde3(data.getKohde3());
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
		
		result.setSuunnitelmaLaadittu(data.getSuunnitelmaLaadittu());
		
		result.setProjektipaallikko(data.getProjektipaallikko());
		
		result.setRivimuokkaajatunnus(data.getRivimuokkaajatunnus());
		return result;
	}

	@Override
	public ContentDto modelToDto(Haettava modelObject, Integer... parentId) {
		if (modelObject == null)
			return null;
		RautatienYleissuunnitelma data = (RautatienYleissuunnitelma) modelObject;
		RautatienYleissuunnitelmaDto result = new RautatienYleissuunnitelmaDto();
		result.setTunnus(data.getTunnus());
		result.setNimi(data.getNimi());
		
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
		result.setSisaltaaLakkaamisen(data.getSisaltaaLakkaamisen());
		result.setKiirellinenKasittelyPyydetty(data.getKiirellinenKasittelyPyydetty());
		result.setMuistutuksia(data.getMuistutuksia());
		result.setKohde1(data.getKohde1());
		result.setKohde2(data.getKohde2());
		result.setKohde3(data.getKohde3());
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
		
		result.setSuunnitelmaLaadittu(data.getSuunnitelmaLaadittu());
		
		result.setProjektipaallikko(data.getProjektipaallikko());
		
		return result;
	}
}
