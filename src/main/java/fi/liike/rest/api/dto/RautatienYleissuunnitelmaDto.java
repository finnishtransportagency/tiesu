package fi.liike.rest.api.dto;

import fi.liike.rest.api.ContentDto;
import fi.liike.rest.auth.Right;

import java.math.BigDecimal;
import java.util.List;

public class RautatienYleissuunnitelmaDto extends ContentDto {

	private Integer tunnus;
    
    private String nimi;
    
    private String kuvaus;
    
    private String asianumero;
    
    private String elyKeskus;
    
    private Integer suunnitelmanStatus;
	
	private Integer yvaHanke;
	
	private String hyvaksymisesitysLaadittu;
	
	private String hyvaksymisesitysSaapunut;
	
	private String aloituskuulutus;
	
	private Float kokonaiskustannukset;
	
	private Float kustannuksetValtio;
	
	private Float kustannuksetKunta;
	
	private Float kustannuksetSahko;
	
	private Float kustannuksetViestinta;

	private Float kustannuksetVesi;
	
	private Float kustannuksetMuut;

	private Integer indeksiVuosi;

	private BigDecimal maarakennusIndeksi;
	
	private Integer sisaltaaLakkaamisen;

	private Integer kiirellinenKasittelyPyydetty;

	private Integer muistutuksia;
	
    private Integer kohde1;
	
    private Integer kohde2;
    
    private Integer kohde3;

    private String selitys;

	private String hyvaksymispaatosAnnettu;

	private String jatkopaatosAnnettu1;

	private String jatkopaatosAnnettu2;

	private String hyvaksymisesitysLvmLaadittu;

	private String hyvaksymispaatosLvmAnnettu;

	private String jatkopaatosLvmAnnettu;

	private String osapaatosAnnettu;

	private Integer valituksia;

	private String valiapaatosHao;

	private Integer hyvaksymispaatosHaoKumottu;

	private String paatosHao;

    private String paatosHaoSisalto;

	private String valiapaatosKho;

	private Integer hyvaksymispaatosKhoKumottu;

	private String paatosKho;

	private String paatosKhoSisalto;
	
	private String valiPaatosKhoSisalto;
	
	private String valiPaatosHaoSisalto;

	private String lainvoimaisuus;

	private String lainvoimaisuudenPaattyminen;
	
	private String liikenteeseenOsaLuovutus;

	private String liikenteeseenKokoLuovutus;
	
	private String palautettuElylle;
	
	private String rauennut;
	
	private String suunnitelmaLaadittu;
	
	private String projektipaallikko;
	
	private String rivimuokkaajatunnus;
	

	@Override
	public Integer getTunnus() {
		return tunnus;
	}

	@Override
	public void setTunnus(Integer tunnus) {
		this.tunnus = tunnus;
	}

	@Override
	public String getNimi() {
		return nimi;
	}

	@Override
	public void setNimi(String nimi) {
		this.nimi = nimi;
	}

	public String getKuvaus() {
		return kuvaus;
	}

	public void setKuvaus(String kuvaus) {
		this.kuvaus = kuvaus;
	}

	public String getAsianumero() {
		return asianumero;
	}

	public void setAsianumero(String asianumero) {
		this.asianumero = asianumero;
	}

	public String getElyKeskus() {
		return elyKeskus;
	}

	public void setElyKeskus(String elyKeskus) {
		this.elyKeskus = elyKeskus;
	}

	public Integer getSuunnitelmanStatus() {
		return suunnitelmanStatus;
	}

	public void setSuunnitelmanStatus(Integer suunnitelmanStatus) {
		this.suunnitelmanStatus = suunnitelmanStatus;
	}

	public Integer getYvaHanke() {
		return yvaHanke;
	}

	public void setYvaHanke(Integer yvaHanke) {
		this.yvaHanke = yvaHanke;
	}

	public String getHyvaksymisesitysLaadittu() {
		return hyvaksymisesitysLaadittu;
	}

	public void setHyvaksymisesitysLaadittu(String hyvaksymisesitysLaadittu) {
		this.hyvaksymisesitysLaadittu = hyvaksymisesitysLaadittu;
	}

	public String getHyvaksymisesitysSaapunut() {
		return hyvaksymisesitysSaapunut;
	}

	public void setHyvaksymisesitysSaapunut(String hyvaksymisesitysSaapunut) {
		this.hyvaksymisesitysSaapunut = hyvaksymisesitysSaapunut;
	}

	public String getAloituskuulutus() {
		return aloituskuulutus;
	}

	public void setAloituskuulutus(String aloituskuulutus) {
		this.aloituskuulutus = aloituskuulutus;
	}

	public Float getKokonaiskustannukset() {
		return kokonaiskustannukset;
	}

	public void setKokonaiskustannukset(Float kokonaiskustannukset) {
		this.kokonaiskustannukset = kokonaiskustannukset;
	}

	public Float getKustannuksetValtio() {
		return kustannuksetValtio;
	}

	public void setKustannuksetValtio(Float kustannuksetValtio) {
		this.kustannuksetValtio = kustannuksetValtio;
	}

	public Float getKustannuksetKunta() {
		return kustannuksetKunta;
	}

	public void setKustannuksetKunta(Float kustannuksetKunta) {
		this.kustannuksetKunta = kustannuksetKunta;
	}

	public Float getKustannuksetSahko() {
		return kustannuksetSahko;
	}

	public void setKustannuksetSahko(Float kustannuksetSahko) {
		this.kustannuksetSahko = kustannuksetSahko;
	}

	public Float getKustannuksetViestinta() {
		return kustannuksetViestinta;
	}

	public void setKustannuksetViestinta(Float kustannuksetViestinta) {
		this.kustannuksetViestinta = kustannuksetViestinta;
	}

	public Float getKustannuksetVesi() {
		return kustannuksetVesi;
	}

	public void setKustannuksetVesi(Float kustannuksetVesi) {
		this.kustannuksetVesi = kustannuksetVesi;
	}

	public Float getKustannuksetMuut() {
		return kustannuksetMuut;
	}

	public void setKustannuksetMuut(Float kustannuksetMuut) {
		this.kustannuksetMuut = kustannuksetMuut;
	}

	public Integer getIndeksiVuosi() {
		return indeksiVuosi;
	}

	public void setIndeksiVuosi(Integer indeksiVuosi) {
		this.indeksiVuosi = indeksiVuosi;
	}

	public BigDecimal getMaarakennusIndeksi() {
		return maarakennusIndeksi;
	}

	public void setMaarakennusIndeksi(BigDecimal maarakennusIndeksi) {
		this.maarakennusIndeksi = maarakennusIndeksi;
	}

	public Integer getSisaltaaLakkaamisen() {
		return sisaltaaLakkaamisen;
	}

	public void setSisaltaaLakkaamisen(Integer sisaltaaLakkaamisen) {
		this.sisaltaaLakkaamisen = sisaltaaLakkaamisen;
	}

	public Integer getKiirellinenKasittelyPyydetty() {
		return kiirellinenKasittelyPyydetty;
	}

	public void setKiirellinenKasittelyPyydetty(Integer kiirellinenKasittelyPyydetty) {
		this.kiirellinenKasittelyPyydetty = kiirellinenKasittelyPyydetty;
	}

	public Integer getMuistutuksia() {
		return muistutuksia;
	}

	public void setMuistutuksia(Integer muistutuksia) {
		this.muistutuksia = muistutuksia;
	}

	public Integer getKohde1() {
		return kohde1;
	}

	public void setKohde1(Integer kohde1) {
		this.kohde1 = kohde1;
	}

	public Integer getKohde2() {
		return kohde2;
	}

	public void setKohde2(Integer kohde2) {
		this.kohde2 = kohde2;
	}
	
	public Integer getKohde3() {
		return kohde3;
	}

	public void setKohde3(Integer kohde3) {
		this.kohde3 = kohde3;
	}

	public String getSelitys() {
		return selitys;
	}

	public void setSelitys(String selitys) {
		this.selitys = selitys;
	}

	public String getHyvaksymispaatosAnnettu() {
		return hyvaksymispaatosAnnettu;
	}

	public void setHyvaksymispaatosAnnettu(String hyvaksymispaatosAnnettu) {
		this.hyvaksymispaatosAnnettu = hyvaksymispaatosAnnettu;
	}

	public String getJatkopaatosAnnettu1() {
		return jatkopaatosAnnettu1;
	}

	public void setJatkopaatosAnnettu1(String jatkopaatosAnnettu1) {
		this.jatkopaatosAnnettu1 = jatkopaatosAnnettu1;
	}

	public String getJatkopaatosAnnettu2() {
		return jatkopaatosAnnettu2;
	}

	public void setJatkopaatosAnnettu2(String jatkopaatosAnnettu2) {
		this.jatkopaatosAnnettu2 = jatkopaatosAnnettu2;
	}

	public String getHyvaksymisesitysLvmLaadittu() {
		return hyvaksymisesitysLvmLaadittu;
	}

	public void setHyvaksymisesitysLvmLaadittu(String hyvaksymisesitysLvmLaadittu) {
		this.hyvaksymisesitysLvmLaadittu = hyvaksymisesitysLvmLaadittu;
	}

	public String getHyvaksymispaatosLvmAnnettu() {
		return hyvaksymispaatosLvmAnnettu;
	}

	public void setHyvaksymispaatosLvmAnnettu(String hyvaksymispaatosLvmAnnettu) {
		this.hyvaksymispaatosLvmAnnettu = hyvaksymispaatosLvmAnnettu;
	}

	public String getJatkopaatosLvmAnnettu() {
		return jatkopaatosLvmAnnettu;
	}

	public void setJatkopaatosLvmAnnettu(String jatkopaatosLvmAnnettu) {
		this.jatkopaatosLvmAnnettu = jatkopaatosLvmAnnettu;
	}

	public String getOsapaatosAnnettu() {
		return osapaatosAnnettu;
	}

	public void setOsapaatosAnnettu(String osapaatosAnnettu) {
		this.osapaatosAnnettu = osapaatosAnnettu;
	}

	public Integer getValituksia() {
		return valituksia;
	}

	public void setValituksia(Integer valituksia) {
		this.valituksia = valituksia;
	}

	public String getValiapaatosHao() {
		return valiapaatosHao;
	}

	public void setValiapaatosHao(String valiapaatosHao) {
		this.valiapaatosHao = valiapaatosHao;
	}

	public Integer getHyvaksymispaatosHaoKumottu() {
		return hyvaksymispaatosHaoKumottu;
	}

	public void setHyvaksymispaatosHaoKumottu(Integer hyvaksymispaatosHaoKumottu) {
		this.hyvaksymispaatosHaoKumottu = hyvaksymispaatosHaoKumottu;
	}

	public String getPaatosHao() {
		return paatosHao;
	}

	public void setPaatosHao(String paatosHao) {
		this.paatosHao = paatosHao;
	}

	public String getPaatosHaoSisalto() {
		return paatosHaoSisalto;
	}

	public void setPaatosHaoSisalto(String paatosHaoSisalto) {
		this.paatosHaoSisalto = paatosHaoSisalto;
	}

	public String getValiapaatosKho() {
		return valiapaatosKho;
	}

	public void setValiapaatosKho(String valiapaatosKho) {
		this.valiapaatosKho = valiapaatosKho;
	}

	public Integer getHyvaksymispaatosKhoKumottu() {
		return hyvaksymispaatosKhoKumottu;
	}

	public void setHyvaksymispaatosKhoKumottu(Integer hyvaksymispaatosKhoKumottu) {
		this.hyvaksymispaatosKhoKumottu = hyvaksymispaatosKhoKumottu;
	}

	public String getPaatosKho() {
		return paatosKho;
	}

	public void setPaatosKho(String paatosKho) {
		this.paatosKho = paatosKho;
	}

	public String getPaatosKhoSisalto() {
		return paatosKhoSisalto;
	}

	public void setPaatosKhoSisalto(String paatosKhoSisalto) {
		this.paatosKhoSisalto = paatosKhoSisalto;
	}

	public String getValiPaatosKhoSisalto() {
		return valiPaatosKhoSisalto;
	}

	public void setValiPaatosKhoSisalto(String valiPaatosKhoSisalto) {
		this.valiPaatosKhoSisalto = valiPaatosKhoSisalto;
	}

	public String getValiPaatosHaoSisalto() {
		return valiPaatosHaoSisalto;
	}

	public void setValiPaatosHaoSisalto(String valiPaatosHaoSisalto) {
		this.valiPaatosHaoSisalto = valiPaatosHaoSisalto;
	}

	public String getLainvoimaisuus() {
		return lainvoimaisuus;
	}

	public void setLainvoimaisuus(String lainvoimaisuus) {
		this.lainvoimaisuus = lainvoimaisuus;
	}

	public String getLainvoimaisuudenPaattyminen() {
		return lainvoimaisuudenPaattyminen;
	}

	public void setLainvoimaisuudenPaattyminen(String lainvoimaisuudenPaattyminen) {
		this.lainvoimaisuudenPaattyminen = lainvoimaisuudenPaattyminen;
	}

	public String getLiikenteeseenOsaLuovutus() {
		return liikenteeseenOsaLuovutus;
	}

	public void setLiikenteeseenOsaLuovutus(String liikenteeseenOsaLuovutus) {
		this.liikenteeseenOsaLuovutus = liikenteeseenOsaLuovutus;
	}

	public String getLiikenteeseenKokoLuovutus() {
		return liikenteeseenKokoLuovutus;
	}

	public void setLiikenteeseenKokoLuovutus(String liikenteeseenKokoLuovutus) {
		this.liikenteeseenKokoLuovutus = liikenteeseenKokoLuovutus;
	}

	public String getPalautettuElylle() {
		return palautettuElylle;
	}

	public void setPalautettuElylle(String palautettuElylle) {
		this.palautettuElylle = palautettuElylle;
	}

	public String getRauennut() {
		return rauennut;
	}

	public void setRauennut(String rauennut) {
		this.rauennut = rauennut;
	}

	public String getProjektipaallikko() {
		return projektipaallikko;
	}

	public void setProjektipaallikko(String projektipaallikko) {
		this.projektipaallikko = projektipaallikko;
	}

	public String getSuunnitelmaLaadittu() {
		return suunnitelmaLaadittu;
	}

	public void setSuunnitelmaLaadittu(String suunnitelmaLaadittu) {
		this.suunnitelmaLaadittu = suunnitelmaLaadittu;
	}

	@Override
	public String toString() {
		return "Palvelu[tunnus=" + tunnus + ", nimi=" + nimi + "]";
	}

	public String getRivimuokkaajatunnus() {
		return rivimuokkaajatunnus;
	}

	@Override
	public List<Right> getNeededRights() {
		return null;
	}

	@Override
	public void setRivimuokkaajatunnus(String rivimuokkaajatunnus) {
		this.rivimuokkaajatunnus = rivimuokkaajatunnus;
	}
}
