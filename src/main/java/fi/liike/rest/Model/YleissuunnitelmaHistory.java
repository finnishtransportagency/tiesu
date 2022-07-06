package fi.liike.rest.Model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import fi.liike.rest.api.HistoryType;

@Entity
@Table(name = "yleissuunnitelmahistoria")
public class YleissuunnitelmaHistory implements Serializable, HaettavaHistory {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "seq_gen")
	@SequenceGenerator(name = "seq_gen", sequenceName = "yleissuunnitelma_hist_seq")
	@Column(name = "RIVI_ID", unique = true, nullable = false)
	private Long rivi_id;

	@Column(name = "HISTORIATYYPPI")
	@Enumerated(EnumType.STRING)
	private HistoryType historiatyyppi;

	@Column(name = "TUNNUS", unique = true, nullable = false)
	private Integer tunnus;

	@Column(name = "SUUNNITELMAN_NIMI")
	private String nimi;

	@Column(name = "KASITTELIJA")
	private String kasittelija;

	@Column(name = "SUUNNITELMAN_KUVAUS")
	private String kuvaus;

	@Column(name = "ASIANUMERO")
	private String asianumero;

	@Column(name = "ELY_KESKUS")
	private String elyKeskus;

	@Column(name = "STATUS_ID")
	private Integer suunnitelmanStatus;

	@Column(name = "YVA_HANKE")
	private Integer yvaHanke;

	@Column(name = "HYVAKSYTTY_ESITYS_LAADITTU")
	private Date hyvaksymisesitysLaadittu;

	@Column(name = "HYVAKSYTTY_ESITYS_SAAPUNUT")
	private Date hyvaksymisesitysSaapunut;

	@Column(name = "ALOITUSKUULUTUS")
	private Date aloituskuulutus;

	@Column(name = "KOKONAISKUSTANNUKSET")
	private Float kokonaiskustannukset;

	@Column(name = "VALTIO")
	private Float kustannuksetValtio;

	@Column(name = "KUNTA")
	private Float kustannuksetKunta;

	@Column(name = "MUUT")
	private Float kustannuksetMuut;

	@Column(name = "SAHKO")
	private Float kustannuksetSahko;

	@Column(name = "VIESTINTA")
	private Float kustannuksetViestinta;

	@Column(name = "VESI")
	private Float kustannuksetVesi;

	@Column(name = "INDEKSIVUOSILUKU")
	private Integer indeksiVuosi;

	@Column(name = "MAARAKENNUSINDEKSI")
	private BigDecimal maarakennusIndeksi;

	@Column(name = "MAANTIEN_LAKKAAMINEN")
	private Integer sisaltaaMaantienLakkaamisen;

	@Column(name = "KIIREELLINEN_KASITTELY")
	private Integer kiirellinenKasittelyPyydetty;

	@Column(name = "MUISTUTUSTEN_LUKUMAARA")
	private Integer muistutuksia;

	@Column(name = "KOHDE_ID")
	private Integer kohde1;

	@Column(name = "KOHDE_ID2")
	private Integer kohde2;

	@Column(name = "SELITYS")
	private String selitys;

	@Column(name = "HYVAKSYTTY_PAATOS_ANNETTU")
	private Date hyvaksymispaatosAnnettu;

	@Column(name = "JATKOPAATOS_1_ANNETTU")
	private Date jatkopaatosAnnettu1;

	@Column(name = "JATKOPAATOS_2_ANNETTU")
	private Date jatkopaatosAnnettu2;

	@Column(name = "LVM_LAADITTU")
	private Date hyvaksymisesitysLvmLaadittu;

	@Column(name = "LVM_HYVAKSYMISPAATOS")
	private Date hyvaksymispaatosLvmAnnettu;

	@Column(name = "LVM_JATKOPAATOS")
	private Date jatkopaatosLvmAnnettu;

	@Column(name = "OSAPAATOS_ANNETTU")
	private Date osapaatosAnnettu;

	@Column(name = "VALITUSTEN_MAARA")
	private Integer valituksia;

	@Column(name = "HAO_VALIPAATOKSEN_PAIVAMAARA")
	private String valiapaatosHao;

	@Column(name = "HAO_KUMOTTU")
	private Integer hyvaksymispaatosHaoKumottu;

	@Column(name = "HAO_PVM")
	private Date paatosHao;

	@Column(name = "HAO_SISALTO")
	private String paatosHaoSisalto;

	@Column(name = "KHO_VALIPAATOKSEN_PAIVAMAARA")
	private String valiapaatosKho;

	@Column(name = "KHO_KUMOTTU")
	private Integer hyvaksymispaatosKhoKumottu;

	@Column(name = "KHO_PVM")
	private Date paatosKho;

	@Column(name = "KHO_SISALTO")
	private String paatosKhoSisalto;

	@Column(name = "LAINVOIMAISUUS")
	private Date lainvoimaisuus;

	@Column(name = "LAINVOIMAISUUS_PAATTYY")
	private Date lainvoimaisuudenPaattyminen;
	
	@Column(name="RAUENNUT")
	private Date rauennut;

	@Column(name = "PALAUTETTU_ELYLLE")
	private Date palautettuElylle;

	@Column(name = "SUUNNITELMA_LAADITTU")
	private String suunnitelmaLaadittu;

	@Column(name = "RIVILUOTUPVM")
	private Timestamp riviluotupvm;

	@Column(name = "RIVIMUOKKAAJATUNNUS")
	private String rivimuokkaajatunnus;

	@Column(name = "DOCUMENT_ID")
	private String documentId;

	@Column(name = "RIVITUNNUS")
	private int rivitunnus;

	@Column(name = "RIVITILA")
	private String rivitila;

	public HistoryType getHistoriatyyppi() {
		return historiatyyppi;
	}

	public void setHistoriatyyppi(HistoryType historiatyyppi) {
		this.historiatyyppi = historiatyyppi;
	}

	public Integer getTunnus() {
		return tunnus;
	}

	public void setTunnus(Integer tunnus) {
		this.tunnus = tunnus;
	}

	public String getNimi() {
		return nimi;
	}

	public void setNimi(String nimi) {
		this.nimi = nimi;
	}

	public String getKasittelija() {
		return kasittelija;
	}

	public void setKasittelija(String kasittelija) {
		this.kasittelija = kasittelija;
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

	public Date getHyvaksymisesitysLaadittu() {
		return hyvaksymisesitysLaadittu;
	}

	public void setHyvaksymisesitysLaadittu(Date hyvaksymisesitysLaadittu) {
		this.hyvaksymisesitysLaadittu = hyvaksymisesitysLaadittu;
	}

	public Date getHyvaksymisesitysSaapunut() {
		return hyvaksymisesitysSaapunut;
	}

	public void setHyvaksymisesitysSaapunut(Date hyvaksymisesitysSaapunut) {
		this.hyvaksymisesitysSaapunut = hyvaksymisesitysSaapunut;
	}

	public Date getAloituskuulutus() {
		return aloituskuulutus;
	}

	public void setAloituskuulutus(Date aloituskuulutus) {
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

	public Float getKustannuksetMuut() {
		return kustannuksetMuut;
	}

	public void setKustannuksetMuut(Float kustannuksetMuut) {
		this.kustannuksetMuut = kustannuksetMuut;
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

	public Integer getSisaltaaMaantienLakkaamisen() {
		return sisaltaaMaantienLakkaamisen;
	}

	public void setSisaltaaMaantienLakkaamisen(Integer sisaltaaMaantienLakkaamisen) {
		this.sisaltaaMaantienLakkaamisen = sisaltaaMaantienLakkaamisen;
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

	public String getSelitys() {
		return selitys;
	}

	public void setSelitys(String selitys) {
		this.selitys = selitys;
	}

	public Date getHyvaksymispaatosAnnettu() {
		return hyvaksymispaatosAnnettu;
	}

	public void setHyvaksymispaatosAnnettu(Date hyvaksymispaatosAnnettu) {
		this.hyvaksymispaatosAnnettu = hyvaksymispaatosAnnettu;
	}

	public Date getJatkopaatosAnnettu1() {
		return jatkopaatosAnnettu1;
	}

	public void setJatkopaatosAnnettu1(Date jatkopaatosAnnettu1) {
		this.jatkopaatosAnnettu1 = jatkopaatosAnnettu1;
	}

	public Date getJatkopaatosAnnettu2() {
		return jatkopaatosAnnettu2;
	}

	public void setJatkopaatosAnnettu2(Date jatkopaatosAnnettu2) {
		this.jatkopaatosAnnettu2 = jatkopaatosAnnettu2;
	}

	public Date getHyvaksymisesitysLvmLaadittu() {
		return hyvaksymisesitysLvmLaadittu;
	}

	public void setHyvaksymisesitysLvmLaadittu(Date hyvaksymisesitysLvmLaadittu) {
		this.hyvaksymisesitysLvmLaadittu = hyvaksymisesitysLvmLaadittu;
	}

	public Date getHyvaksymispaatosLvmAnnettu() {
		return hyvaksymispaatosLvmAnnettu;
	}

	public void setHyvaksymispaatosLvmAnnettu(Date hyvaksymispaatosLvmAnnettu) {
		this.hyvaksymispaatosLvmAnnettu = hyvaksymispaatosLvmAnnettu;
	}

	public Date getJatkopaatosLvmAnnettu() {
		return jatkopaatosLvmAnnettu;
	}

	public void setJatkopaatosLvmAnnettu(Date jatkopaatosLvmAnnettu) {
		this.jatkopaatosLvmAnnettu = jatkopaatosLvmAnnettu;
	}

	public Date getOsapaatosAnnettu() {
		return osapaatosAnnettu;
	}

	public void setOsapaatosAnnettu(Date osapaatosAnnettu) {
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

	public Date getPaatosHao() {
		return paatosHao;
	}

	public void setPaatosHao(Date paatosHao) {
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

	public Date getPaatosKho() {
		return paatosKho;
	}

	public void setPaatosKho(Date paatosKho) {
		this.paatosKho = paatosKho;
	}

	public String getPaatosKhoSisalto() {
		return paatosKhoSisalto;
	}

	public void setPaatosKhoSisalto(String paatosKhoSisalto) {
		this.paatosKhoSisalto = paatosKhoSisalto;
	}

	public Date getLainvoimaisuus() {
		return lainvoimaisuus;
	}

	public void setLainvoimaisuus(Date lainvoimaisuus) {
		this.lainvoimaisuus = lainvoimaisuus;
	}

	public Date getLainvoimaisuudenPaattyminen() {
		return lainvoimaisuudenPaattyminen;
	}

	public void setLainvoimaisuudenPaattyminen(Date lainvoimaisuudenPaattyminen) {
		this.lainvoimaisuudenPaattyminen = lainvoimaisuudenPaattyminen;
	}

	public Date getRauennut() {
		return rauennut;
	}

	public void setRauennut(Date rauennut) {
		this.rauennut = rauennut;
	}

	public Date getPalautettuElylle() {
		return palautettuElylle;
	}

	public void setPalautettuElylle(Date palautettuElylle) {
		this.palautettuElylle = palautettuElylle;
	}

	public String getSuunnitelmaLaadittu() {
		return suunnitelmaLaadittu;
	}

	public void setSuunnitelmaLaadittu(String suunnitelmaLaadittu) {
		this.suunnitelmaLaadittu = suunnitelmaLaadittu;
	}

	public void setRivi_id(Long rivi_id) {
		this.rivi_id = rivi_id;
	}

	@Override
	public String toString() {
		return "YleissuunnitelmaHistory[tunnus=" + tunnus + ", nimi=" + nimi + "]";
	}

	public String getRivitila() {
		return rivitila;
	}

	public void setRivitila(String rivitila) {
		this.rivitila = rivitila;
	}

	public int getRivitunnus() {
		return rivitunnus;
	}

	public void setRivitunnus(int rivitunnus) {
		this.rivitunnus = rivitunnus;
	}

	@Override
	public Timestamp getRiviluotupvm() {
		return riviluotupvm;
	}

	@Override
	public void setRiviluotupvm(Timestamp riviluotupvm) {
		this.riviluotupvm = riviluotupvm;
	}

	public String getRivimuokkaajatunnus() {
		return rivimuokkaajatunnus;
	}

	public void setRivimuokkaajatunnus(String rivimuokkaajatunnus) {
		this.rivimuokkaajatunnus = rivimuokkaajatunnus;
	}

	public String getDocumentId() {
		return documentId;
	}

	public void setDocumentId(String documentId) {
		this.documentId = documentId;
	}

	public Long getRivi_id() {
		return rivi_id;
	}

}
