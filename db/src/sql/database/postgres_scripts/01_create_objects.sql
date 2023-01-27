-- tiesu.dbmaintain_scripts definition

-- Drop table

-- DROP TABLE tiesu.dbmaintain_scripts;

CREATE TABLE tiesu.dbmaintain_scripts (
	file_name varchar(150) NULL,
	file_last_modified_at numeric(38) NULL,
	checksum varchar(50) NULL,
	executed_at varchar(20) NULL,
	succeeded numeric(38) NULL
);


-- tiesu.palvelupaikat definition

-- Drop table

-- DROP TABLE tiesu.palvelupaikat;

CREATE TABLE tiesu.palvelupaikat (
	nimi varchar(1000) NULL,
	lyhenne varchar(100) NULL,
	rataosa varchar(1000) NULL,
	tyyppi varchar(1000) NULL,
	henkiloliikenne varchar(50) NULL,
	tavaraliikenne varchar(50) NULL,
	kaukoohjaus varchar(50) NULL,
	liikennepaikan_ohitus varchar(100) NULL,
	lahto_maara varchar(100) NULL,
	veturin_huoltoon_sta varchar(100) NULL,
	manuaalivaihdetyo_tarvitaan varchar(100) NULL,
	rajoitevaihtokulkutienmuodost varchar(100) NULL,
	ratatyon_turvaus varchar(100) NULL,
	urakoitsija_finrail varchar(50) NULL,
	urakoitsija_vr varchar(50) NULL,
	urakoitsija_joku_muu varchar(2000) NULL,
	huomautus varchar(2000) NULL,
	lisamiehityksen_tilaus varchar(2000) NULL,
	created timestamp NULL,
	last_modified_date timestamp NULL,
	last_modified_by varchar(500) NULL,
	username varchar(500) NULL,
	form_version varchar(50) NULL,
	document_id varchar(100) NULL,
	deleted varchar(50) NULL,
	app varchar(500) NULL,
	form varchar(500) NULL
);


-- tiesu.ratasuunnitelma definition

-- Drop table

-- DROP TABLE tiesu.ratasuunnitelma;

CREATE TABLE tiesu.ratasuunnitelma (
	tunnus numeric(38) NOT NULL,
	suunnitelman_nimi varchar(1000) NOT NULL,
	suunnitelman_kuvaus varchar(2000) NULL,
	yva_hanke numeric(38, 10) NULL,
	asianumero varchar(60) NOT NULL,
	ely_keskus varchar(50) NULL,
	status_id numeric(38) NULL,
	hyvaksytty_esitys_laadittu timestamp NULL,
	hyvaksytty_esitys_saapunut timestamp NULL,
	aloituskuulutus timestamp NULL,
	kokonaiskustannukset float8 NULL,
	valtio float8 NULL,
	kunta float8 NULL,
	muut float8 NULL,
	indeksivuosiluku numeric(38) NULL,
	maarakennusindeksi numeric(38, 19) NULL,
	lakkaaminen numeric(38, 10) NULL,
	kiireellinen_kasittely numeric(38, 10) NULL,
	muistutusten_lukumaara numeric(38) NULL,
	kohde_id1 numeric(38) NULL,
	kohde_id2 numeric(38) NULL,
	selitys varchar(1000) NULL,
	hyvaksytty_paatos_annettu timestamp NULL,
	jatkopaatos_1_annettu timestamp NULL,
	jatkopaatos_2_annettu timestamp NULL,
	palautettu_elylle timestamp NULL,
	lvm_laadittu timestamp NULL,
	lvm_hyvaksymispaatos timestamp NULL,
	lvm_jatkopaatos timestamp NULL,
	old_osapaatos_annettu varchar(500) NULL,
	valitusten_maara numeric(38) NULL,
	hao_valipaatoksen_paivamaara varchar(500) NULL,
	hao_kumottu numeric(38, 10) NULL,
	hao_pvm timestamp NULL,
	hao_sisalto varchar(1000) NULL,
	kho_valipaatoksen_paivamaara varchar(1000) NULL,
	kho_kumottu numeric(38, 10) NULL,
	kho_pvm timestamp NULL,
	kho_sisalto varchar(1000) NULL,
	old_lainvoimaisuus varchar(200) NULL,
	lainvoimaisuus_paattyy timestamp NULL,
	rauennut varchar(1000) NULL,
	suunnitelma_laadittu varchar(1000) NULL,
	kasittelija varchar(100) NULL,
	riviluotupvm timestamp NULL,
	rivimuokattupvm timestamp NULL,
	rivimuokkaajatunnus varchar(150) NULL,
	document_id varchar(255) NULL,
	hao_valipaatos_sisalto varchar(1000) NULL,
	kho_valipaatos_sisalto varchar(1000) NULL,
	kayttoonottoluovutus_osa timestamp NULL,
	kayttoonottoluovutus_koko timestamp NULL,
	sahko float8 NULL,
	viestinta float8 NULL,
	vesi float8 NULL,
	lainvoimaisuus timestamp NULL,
	osapaatos_annettu timestamp NULL,
	sistiesuunnittelua numeric(38, 10) NULL,
	ratatoimitustehty timestamp NULL,
	CONSTRAINT "RATASUUNNITELMA_pkey" PRIMARY KEY (tunnus)
);


-- tiesu.ratasuunnitelma_15102020 definition

-- Drop table

-- DROP TABLE tiesu.ratasuunnitelma_15102020;

CREATE TABLE tiesu.ratasuunnitelma_15102020 (
	tunnus numeric(38) NOT NULL,
	suunnitelman_nimi varchar(1000) NOT NULL,
	suunnitelman_kuvaus varchar(2000) NULL,
	yva_hanke numeric(38, 10) NULL,
	asianumero varchar(60) NOT NULL,
	ely_keskus varchar(50) NULL,
	status_id numeric(38) NULL,
	hyvaksytty_esitys_laadittu timestamp NULL,
	hyvaksytty_esitys_saapunut timestamp NULL,
	aloituskuulutus timestamp NULL,
	kokonaiskustannukset float8 NULL,
	valtio float8 NULL,
	kunta float8 NULL,
	muut float8 NULL,
	indeksivuosiluku numeric(38) NULL,
	maarakennusindeksi numeric(38, 19) NULL,
	lakkaaminen numeric(38, 10) NULL,
	kiireellinen_kasittely numeric(38, 10) NULL,
	muistutusten_lukumaara numeric(38) NULL,
	kohde_id1 numeric(38) NULL,
	kohde_id2 numeric(38) NULL,
	selitys varchar(1000) NULL,
	hyvaksytty_paatos_annettu timestamp NULL,
	jatkopaatos_1_annettu timestamp NULL,
	jatkopaatos_2_annettu timestamp NULL,
	palautettu_elylle timestamp NULL,
	lvm_laadittu timestamp NULL,
	lvm_hyvaksymispaatos timestamp NULL,
	lvm_jatkopaatos timestamp NULL,
	osapaatos_annettu varchar(500) NULL,
	valitusten_maara numeric(38) NULL,
	hao_valipaatoksen_paivamaara varchar(500) NULL,
	hao_kumottu numeric(38, 10) NULL,
	hao_pvm timestamp NULL,
	hao_sisalto varchar(1000) NULL,
	kho_valipaatoksen_paivamaara varchar(1000) NULL,
	kho_kumottu numeric(38, 10) NULL,
	kho_pvm timestamp NULL,
	kho_sisalto varchar(1000) NULL,
	lainvoimaisuus varchar(200) NULL,
	lainvoimaisuus_paattyy timestamp NULL,
	rauennut varchar(1000) NULL,
	suunnitelma_laadittu varchar(1000) NULL,
	kasittelija varchar(100) NULL,
	riviluotupvm timestamp NULL,
	rivimuokattupvm timestamp NULL,
	rivimuokkaajatunnus varchar(150) NULL,
	document_id varchar(255) NULL,
	hao_valipaatos_sisalto varchar(1000) NULL,
	kho_valipaatos_sisalto varchar(1000) NULL,
	kayttoonottoluovutus_osa timestamp NULL,
	kayttoonottoluovutus_koko timestamp NULL,
	sahko float8 NULL,
	viestinta float8 NULL,
	vesi float8 NULL
);


-- tiesu.rautatien_yleissuunn_15102020 definition

-- Drop table

-- DROP TABLE tiesu.rautatien_yleissuunn_15102020;

CREATE TABLE tiesu.rautatien_yleissuunn_15102020 (
	tunnus numeric(38) NOT NULL,
	suunnitelman_nimi varchar(1000) NOT NULL,
	suunnitelman_kuvaus varchar(2000) NULL,
	yva_hanke numeric(38, 10) NULL,
	asianumero varchar(60) NOT NULL,
	ely_keskus varchar(50) NULL,
	status_id numeric(38) NULL,
	hyvaksytty_esitys_laadittu timestamp NULL,
	hyvaksytty_esitys_saapunut timestamp NULL,
	aloituskuulutus timestamp NULL,
	kokonaiskustannukset float8 NULL,
	valtio float8 NULL,
	kunta float8 NULL,
	muut float8 NULL,
	indeksivuosiluku numeric(38) NULL,
	maarakennusindeksi numeric(38, 19) NULL,
	lakkaaminen numeric(38, 10) NULL,
	kiireellinen_kasittely numeric(38, 10) NULL,
	muistutusten_lukumaara numeric(38) NULL,
	kohde_id1 numeric(38) NULL,
	kohde_id2 numeric(38) NULL,
	kohde_id3 numeric(38) NULL,
	selitys varchar(1000) NULL,
	hyvaksytty_paatos_annettu timestamp NULL,
	jatkopaatos_1_annettu timestamp NULL,
	jatkopaatos_2_annettu timestamp NULL,
	palautettu_elylle timestamp NULL,
	lvm_laadittu timestamp NULL,
	lvm_hyvaksymispaatos timestamp NULL,
	lvm_jatkopaatos timestamp NULL,
	osapaatos_annettu varchar(500) NULL,
	valitusten_maara numeric(38) NULL,
	hao_valipaatoksen_paivamaara varchar(500) NULL,
	hao_kumottu numeric(38, 10) NULL,
	hao_pvm timestamp NULL,
	hao_sisalto varchar(1000) NULL,
	kho_valipaatoksen_paivamaara varchar(1000) NULL,
	kho_kumottu numeric(38, 10) NULL,
	kho_pvm timestamp NULL,
	kho_sisalto varchar(1000) NULL,
	lainvoimaisuus varchar(200) NULL,
	lainvoimaisuus_paattyy timestamp NULL,
	rauennut varchar(1000) NULL,
	suunnitelma_laadittu varchar(1000) NULL,
	projektipaallikko varchar(100) NULL,
	riviluotupvm timestamp NULL,
	rivimuokattupvm timestamp NULL,
	rivimuokkaajatunnus varchar(150) NULL,
	document_id varchar(255) NULL,
	hao_valipaatos_sisalto varchar(1000) NULL,
	kho_valipaatos_sisalto varchar(1000) NULL,
	sahko float8 NULL,
	viestinta float8 NULL,
	vesi float8 NULL
);


-- tiesu.rautatien_yleissuunnitelma definition

-- Drop table

-- DROP TABLE tiesu.rautatien_yleissuunnitelma;

CREATE TABLE tiesu.rautatien_yleissuunnitelma (
	tunnus numeric(38) NOT NULL,
	suunnitelman_nimi varchar(1000) NOT NULL,
	suunnitelman_kuvaus varchar(2000) NULL,
	yva_hanke numeric(38, 10) NULL,
	asianumero varchar(60) NOT NULL,
	ely_keskus varchar(50) NULL,
	status_id numeric(38) NULL,
	hyvaksytty_esitys_laadittu timestamp NULL,
	hyvaksytty_esitys_saapunut timestamp NULL,
	aloituskuulutus timestamp NULL,
	kokonaiskustannukset float8 NULL,
	valtio float8 NULL,
	kunta float8 NULL,
	muut float8 NULL,
	indeksivuosiluku numeric(38) NULL,
	maarakennusindeksi numeric(38, 19) NULL,
	lakkaaminen numeric(38, 10) NULL,
	kiireellinen_kasittely numeric(38, 10) NULL,
	muistutusten_lukumaara numeric(38) NULL,
	kohde_id1 numeric(38) NULL,
	kohde_id2 numeric(38) NULL,
	kohde_id3 numeric(38) NULL,
	selitys varchar(1000) NULL,
	hyvaksytty_paatos_annettu timestamp NULL,
	jatkopaatos_1_annettu timestamp NULL,
	jatkopaatos_2_annettu timestamp NULL,
	palautettu_elylle timestamp NULL,
	lvm_laadittu timestamp NULL,
	lvm_hyvaksymispaatos timestamp NULL,
	lvm_jatkopaatos timestamp NULL,
	old_osapaatos_annettu varchar(500) NULL,
	valitusten_maara numeric(38) NULL,
	hao_valipaatoksen_paivamaara varchar(500) NULL,
	hao_kumottu numeric(38, 10) NULL,
	hao_pvm timestamp NULL,
	hao_sisalto varchar(1000) NULL,
	kho_valipaatoksen_paivamaara varchar(1000) NULL,
	kho_kumottu numeric(38, 10) NULL,
	kho_pvm timestamp NULL,
	kho_sisalto varchar(1000) NULL,
	old_lainvoimaisuus varchar(200) NULL,
	lainvoimaisuus_paattyy timestamp NULL,
	rauennut varchar(1000) NULL,
	suunnitelma_laadittu varchar(1000) NULL,
	projektipaallikko varchar(100) NULL,
	riviluotupvm timestamp NULL,
	rivimuokattupvm timestamp NULL,
	rivimuokkaajatunnus varchar(150) NULL,
	document_id varchar(255) NULL,
	hao_valipaatos_sisalto varchar(1000) NULL,
	kho_valipaatos_sisalto varchar(1000) NULL,
	sahko float8 NULL,
	viestinta float8 NULL,
	vesi float8 NULL,
	lainvoimaisuus timestamp NULL,
	osapaatos_annettu timestamp NULL,
	CONSTRAINT "RAUTATIEN_YLEISSUUNNITELMA_pkey" PRIMARY KEY (tunnus)
);


-- tiesu.rs_kohde definition

-- Drop table

-- DROP TABLE tiesu.rs_kohde;

CREATE TABLE tiesu.rs_kohde (
	kohde_id numeric(38) NOT NULL,
	kohde_selite varchar(100) NULL,
	readonly numeric(38, 10) NULL,
	CONSTRAINT "RS_KOHDE_pkey" PRIMARY KEY (kohde_id)
);


-- tiesu.rs_status definition

-- Drop table

-- DROP TABLE tiesu.rs_status;

CREATE TABLE tiesu.rs_status (
	status_id numeric(38) NOT NULL,
	selite varchar(300) NULL,
	readonly numeric(38, 10) NULL,
	CONSTRAINT "RS_STATUS_pkey" PRIMARY KEY (status_id)
);


-- tiesu.rt_historia definition

-- Drop table

-- DROP TABLE tiesu.rt_historia;

CREATE TABLE tiesu.rt_historia (
	rivi_id numeric(38, 10) NOT NULL,
	tunnus numeric(38) NULL,
	suunnitelman_nimi varchar(1000) NULL,
	suunnitelman_kuvaus varchar(2000) NULL,
	yva_hanke numeric(38, 10) NULL,
	asianumero varchar(60) NULL,
	ely_keskus varchar(50) NULL,
	status_id numeric(38) NULL,
	hyvaksytty_esitys_laadittu timestamp NULL,
	hyvaksytty_esitys_saapunut timestamp NULL,
	aloituskuulutus timestamp NULL,
	kokonaiskustannukset float8 NULL,
	valtio float8 NULL,
	kunta float8 NULL,
	muut float8 NULL,
	indeksivuosiluku numeric(38) NULL,
	maarakennusindeksi numeric(38, 19) NULL,
	lakkaaminen numeric(38, 10) NULL,
	kiireellinen_kasittely numeric(38, 10) NULL,
	muistutusten_lukumaara numeric(38) NULL,
	kohde_id1 numeric(38) NULL,
	kohde_id2 numeric(38) NULL,
	selitys varchar(1000) NULL,
	hyvaksytty_paatos_annettu timestamp NULL,
	jatkopaatos_1_annettu timestamp NULL,
	jatkopaatos_2_annettu timestamp NULL,
	palautettu_elylle timestamp NULL,
	lvm_laadittu timestamp NULL,
	lvm_hyvaksymispaatos timestamp NULL,
	lvm_jatkopaatos timestamp NULL,
	old_osapaatos_annettu varchar(500) NULL,
	valitusten_maara numeric(38) NULL,
	hao_valipaatoksen_paivamaara varchar(500) NULL,
	hao_kumottu numeric(38, 10) NULL,
	hao_pvm timestamp NULL,
	hao_sisalto varchar(1000) NULL,
	kho_valipaatoksen_paivamaara varchar(1000) NULL,
	kho_kumottu numeric(38, 10) NULL,
	kho_pvm timestamp NULL,
	kho_sisalto varchar(1000) NULL,
	old_lainvoimaisuus varchar(200) NULL,
	lainvoimaisuus_paattyy timestamp NULL,
	rauennut varchar(1000) NULL,
	suunnitelma_laadittu varchar(1000) NULL,
	kasittelija varchar(100) NULL,
	historiatyyppi varchar(6) NOT NULL,
	rivitunnus numeric(38, 10) NULL,
	rivitila varchar(15) NULL,
	riviluotupvm timestamp NULL,
	rivimuokattupvm timestamp NULL,
	rivimuokkaajatunnus varchar(150) NULL,
	document_id varchar(255) NULL,
	hao_valipaatos_sisalto varchar(1000) NULL,
	kho_valipaatos_sisalto varchar(1000) NULL,
	kayttoonottoluovutus_osa timestamp NULL,
	kayttoonottoluovutus_koko timestamp NULL,
	sahko float8 NULL,
	viestinta float8 NULL,
	vesi float8 NULL,
	lainvoimaisuus timestamp NULL,
	osapaatos_annettu timestamp NULL,
	sistiesuunnittelua numeric(38, 10) NULL,
	ratatoimitustehty timestamp NULL,
	CONSTRAINT "RT_HISTORIA_pkey" PRIMARY KEY (rivi_id)
);


-- tiesu.rt_historia_15102020 definition

-- Drop table

-- DROP TABLE tiesu.rt_historia_15102020;

CREATE TABLE tiesu.rt_historia_15102020 (
	rivi_id numeric(38, 10) NOT NULL,
	tunnus numeric(38) NULL,
	suunnitelman_nimi varchar(1000) NULL,
	suunnitelman_kuvaus varchar(2000) NULL,
	yva_hanke numeric(38, 10) NULL,
	asianumero varchar(60) NULL,
	ely_keskus varchar(50) NULL,
	status_id numeric(38) NULL,
	hyvaksytty_esitys_laadittu timestamp NULL,
	hyvaksytty_esitys_saapunut timestamp NULL,
	aloituskuulutus timestamp NULL,
	kokonaiskustannukset float8 NULL,
	valtio float8 NULL,
	kunta float8 NULL,
	muut float8 NULL,
	indeksivuosiluku numeric(38) NULL,
	maarakennusindeksi numeric(38, 19) NULL,
	lakkaaminen numeric(38, 10) NULL,
	kiireellinen_kasittely numeric(38, 10) NULL,
	muistutusten_lukumaara numeric(38) NULL,
	kohde_id1 numeric(38) NULL,
	kohde_id2 numeric(38) NULL,
	selitys varchar(1000) NULL,
	hyvaksytty_paatos_annettu timestamp NULL,
	jatkopaatos_1_annettu timestamp NULL,
	jatkopaatos_2_annettu timestamp NULL,
	palautettu_elylle timestamp NULL,
	lvm_laadittu timestamp NULL,
	lvm_hyvaksymispaatos timestamp NULL,
	lvm_jatkopaatos timestamp NULL,
	osapaatos_annettu varchar(500) NULL,
	valitusten_maara numeric(38) NULL,
	hao_valipaatoksen_paivamaara varchar(500) NULL,
	hao_kumottu numeric(38, 10) NULL,
	hao_pvm timestamp NULL,
	hao_sisalto varchar(1000) NULL,
	kho_valipaatoksen_paivamaara varchar(1000) NULL,
	kho_kumottu numeric(38, 10) NULL,
	kho_pvm timestamp NULL,
	kho_sisalto varchar(1000) NULL,
	lainvoimaisuus varchar(200) NULL,
	lainvoimaisuus_paattyy timestamp NULL,
	rauennut varchar(1000) NULL,
	suunnitelma_laadittu varchar(1000) NULL,
	kasittelija varchar(100) NULL,
	historiatyyppi varchar(6) NOT NULL,
	rivitunnus numeric(38, 10) NULL,
	rivitila varchar(15) NULL,
	riviluotupvm timestamp NULL,
	rivimuokattupvm timestamp NULL,
	rivimuokkaajatunnus varchar(150) NULL,
	document_id varchar(255) NULL,
	hao_valipaatos_sisalto varchar(1000) NULL,
	kho_valipaatos_sisalto varchar(1000) NULL,
	kayttoonottoluovutus_osa timestamp NULL,
	kayttoonottoluovutus_koko timestamp NULL,
	sahko float8 NULL,
	viestinta float8 NULL,
	vesi float8 NULL
);


-- tiesu.rt_kasite_arvo definition

-- Drop table

-- DROP TABLE tiesu.rt_kasite_arvo;

CREATE TABLE tiesu.rt_kasite_arvo (
	kasite_wid numeric(38) NOT NULL,
	kasite varchar(100) NULL,
	arvo varchar(200) NULL,
	CONSTRAINT "RT_KASITE_ARVO_pkey" PRIMARY KEY (kasite_wid)
);


-- tiesu.rt_yleis_kasite_arvo definition

-- Drop table

-- DROP TABLE tiesu.rt_yleis_kasite_arvo;

CREATE TABLE tiesu.rt_yleis_kasite_arvo (
	kasite_wid numeric(38) NOT NULL,
	kasite varchar(100) NULL,
	arvo varchar(200) NULL,
	CONSTRAINT "RT_YLEIS_KASITE_ARVO_pkey" PRIMARY KEY (kasite_wid)
);


-- tiesu.rys_historia definition

-- Drop table

-- DROP TABLE tiesu.rys_historia;

CREATE TABLE tiesu.rys_historia (
	rivi_id numeric(38, 10) NOT NULL,
	tunnus numeric(38) NULL,
	suunnitelman_nimi varchar(1000) NULL,
	suunnitelman_kuvaus varchar(2000) NULL,
	yva_hanke numeric(38, 10) NULL,
	asianumero varchar(60) NULL,
	ely_keskus varchar(50) NULL,
	status_id numeric(38) NULL,
	hyvaksytty_esitys_laadittu timestamp NULL,
	hyvaksytty_esitys_saapunut timestamp NULL,
	aloituskuulutus timestamp NULL,
	kokonaiskustannukset float8 NULL,
	valtio float8 NULL,
	kunta float8 NULL,
	muut float8 NULL,
	indeksivuosiluku numeric(38) NULL,
	maarakennusindeksi numeric(38, 19) NULL,
	lakkaaminen numeric(38, 10) NULL,
	kiireellinen_kasittely numeric(38, 10) NULL,
	muistutusten_lukumaara numeric(38) NULL,
	kohde_id1 numeric(38) NULL,
	kohde_id2 numeric(38) NULL,
	kohde_id3 numeric(38) NULL,
	selitys varchar(1000) NULL,
	hyvaksytty_paatos_annettu timestamp NULL,
	jatkopaatos_1_annettu timestamp NULL,
	jatkopaatos_2_annettu timestamp NULL,
	palautettu_elylle timestamp NULL,
	lvm_laadittu timestamp NULL,
	lvm_hyvaksymispaatos timestamp NULL,
	lvm_jatkopaatos timestamp NULL,
	old_osapaatos_annettu varchar(500) NULL,
	valitusten_maara numeric(38) NULL,
	hao_valipaatoksen_paivamaara varchar(500) NULL,
	hao_kumottu numeric(38, 10) NULL,
	hao_pvm timestamp NULL,
	hao_sisalto varchar(1000) NULL,
	kho_valipaatoksen_paivamaara varchar(1000) NULL,
	kho_kumottu numeric(38, 10) NULL,
	kho_pvm timestamp NULL,
	kho_sisalto varchar(1000) NULL,
	old_lainvoimaisuus varchar(200) NULL,
	lainvoimaisuus_paattyy timestamp NULL,
	rauennut varchar(1000) NULL,
	suunnitelma_laadittu varchar(1000) NULL,
	projektipaallikko varchar(100) NULL,
	historiatyyppi varchar(6) NOT NULL,
	rivitunnus numeric(38, 10) NULL,
	rivitila varchar(15) NULL,
	riviluotupvm timestamp NULL,
	rivimuokattupvm timestamp NULL,
	rivimuokkaajatunnus varchar(150) NULL,
	document_id varchar(255) NULL,
	hao_valipaatos_sisalto varchar(1000) NULL,
	kho_valipaatos_sisalto varchar(1000) NULL,
	sahko float8 NULL,
	viestinta float8 NULL,
	vesi float8 NULL,
	lainvoimaisuus timestamp NULL,
	osapaatos_annettu timestamp NULL,
	CONSTRAINT "RYS_HISTORIA_pkey" PRIMARY KEY (rivi_id)
);


-- tiesu.rys_historia_15102020 definition

-- Drop table

-- DROP TABLE tiesu.rys_historia_15102020;

CREATE TABLE tiesu.rys_historia_15102020 (
	rivi_id numeric(38, 10) NOT NULL,
	tunnus numeric(38) NULL,
	suunnitelman_nimi varchar(1000) NULL,
	suunnitelman_kuvaus varchar(2000) NULL,
	yva_hanke numeric(38, 10) NULL,
	asianumero varchar(60) NULL,
	ely_keskus varchar(50) NULL,
	status_id numeric(38) NULL,
	hyvaksytty_esitys_laadittu timestamp NULL,
	hyvaksytty_esitys_saapunut timestamp NULL,
	aloituskuulutus timestamp NULL,
	kokonaiskustannukset float8 NULL,
	valtio float8 NULL,
	kunta float8 NULL,
	muut float8 NULL,
	indeksivuosiluku numeric(38) NULL,
	maarakennusindeksi numeric(38, 19) NULL,
	lakkaaminen numeric(38, 10) NULL,
	kiireellinen_kasittely numeric(38, 10) NULL,
	muistutusten_lukumaara numeric(38) NULL,
	kohde_id1 numeric(38) NULL,
	kohde_id2 numeric(38) NULL,
	kohde_id3 numeric(38) NULL,
	selitys varchar(1000) NULL,
	hyvaksytty_paatos_annettu timestamp NULL,
	jatkopaatos_1_annettu timestamp NULL,
	jatkopaatos_2_annettu timestamp NULL,
	palautettu_elylle timestamp NULL,
	lvm_laadittu timestamp NULL,
	lvm_hyvaksymispaatos timestamp NULL,
	lvm_jatkopaatos timestamp NULL,
	osapaatos_annettu varchar(500) NULL,
	valitusten_maara numeric(38) NULL,
	hao_valipaatoksen_paivamaara varchar(500) NULL,
	hao_kumottu numeric(38, 10) NULL,
	hao_pvm timestamp NULL,
	hao_sisalto varchar(1000) NULL,
	kho_valipaatoksen_paivamaara varchar(1000) NULL,
	kho_kumottu numeric(38, 10) NULL,
	kho_pvm timestamp NULL,
	kho_sisalto varchar(1000) NULL,
	lainvoimaisuus varchar(200) NULL,
	lainvoimaisuus_paattyy timestamp NULL,
	rauennut varchar(1000) NULL,
	suunnitelma_laadittu varchar(1000) NULL,
	projektipaallikko varchar(100) NULL,
	historiatyyppi varchar(6) NOT NULL,
	rivitunnus numeric(38, 10) NULL,
	rivitila varchar(15) NULL,
	riviluotupvm timestamp NULL,
	rivimuokattupvm timestamp NULL,
	rivimuokkaajatunnus varchar(150) NULL,
	document_id varchar(255) NULL,
	hao_valipaatos_sisalto varchar(1000) NULL,
	kho_valipaatos_sisalto varchar(1000) NULL,
	sahko float8 NULL,
	viestinta float8 NULL,
	vesi float8 NULL
);


-- tiesu.rys_kohde definition

-- Drop table

-- DROP TABLE tiesu.rys_kohde;

CREATE TABLE tiesu.rys_kohde (
	kohde_id numeric(38) NOT NULL,
	kohde_selite varchar(100) NULL,
	readonly numeric(38, 10) NULL,
	CONSTRAINT "RYS_KOHDE_pkey" PRIMARY KEY (kohde_id)
);


-- tiesu.rys_status definition

-- Drop table

-- DROP TABLE tiesu.rys_status;

CREATE TABLE tiesu.rys_status (
	status_id numeric(38) NOT NULL,
	selite varchar(300) NULL,
	readonly numeric(38, 10) NULL,
	CONSTRAINT "RYS_STATUS_pkey" PRIMARY KEY (status_id)
);


-- tiesu.tiesuunnitelma definition

-- Drop table

-- DROP TABLE tiesu.tiesuunnitelma;

CREATE TABLE tiesu.tiesuunnitelma (
	ts_wid numeric(38) NOT NULL,
	tiesuunnitelma_nro numeric(38) NULL,
	tiesuunnitelma_nimi varchar(1000) NOT NULL,
	kasittelija varchar(500) NULL,
	tiesuunnitelman_kuvaus varchar(1000) NULL,
	diaari varchar(250) NOT NULL,
	ely_keskus varchar(10) NULL,
	status_id numeric(38) NULL,
	hyvaksytty_esitys_laadittu timestamp NULL,
	hyvaksytty_esitys_saapunut timestamp NULL,
	kokonaiskustannukset float8 NULL,
	valtio float8 NULL,
	valtio_osuus float8 NULL,
	kunta float8 NULL,
	kunta_osuus float8 NULL,
	muut float8 NULL,
	muut_osuus float8 NULL,
	indeksivuosiluku numeric(38) NULL,
	maarakennusindeksi numeric(38, 19) NULL,
	maantien_lakkaaminen numeric(38, 10) NULL,
	kiireellinen_kasittely numeric(38, 10) NULL,
	muistutusten_lukumaara numeric(38) NULL,
	ts_kohde_id numeric(38) NULL,
	ts_kohde_id2 numeric(38) NULL,
	selitys varchar(1000) NULL,
	hyvaksytty_paatos_annettu timestamp NULL,
	kasittely_vrk numeric(38) NULL,
	lvm_laadittu timestamp NULL,
	lvm_hyvaksymispaatos timestamp NULL,
	jatkopaatos timestamp NULL,
	old_osapaatos_annettu timestamp NULL,
	valitusten_maara numeric(38) NULL,
	hao_valipaatoksen_paivamaara varchar(500) NULL,
	hao_kumottu numeric(38, 10) NULL,
	hao_paatoksen_paivamaara timestamp NULL,
	hao_paatoksen_sisalto varchar(1000) NULL,
	kho_valipaatoksen_paivamaara varchar(1000) NULL,
	kho_kumottu numeric(38, 10) NULL,
	kho_paatoksen_paivamaara timestamp NULL,
	kho_paatoksen_sisalto varchar(1000) NULL,
	old_lainvoimaisuus varchar(1000) NULL,
	lainvoimaisuuden_paattyminen timestamp NULL,
	old_liikenteeseenluovutus_osa varchar(1000) NULL,
	old_liikenteeseenluovutus_koko varchar(1000) NULL,
	yva_hanke numeric(38, 10) NULL,
	aloituskuulutus timestamp NULL,
	sahko float8 NULL,
	viestinta float8 NULL,
	vesi float8 NULL,
	jatkopaatos_1_annettu timestamp NULL,
	jatkopaatos_2_annettu timestamp NULL,
	palautettu_elylle timestamp NULL,
	riviluotupvm timestamp NULL,
	rivimuokattupvm timestamp NULL,
	rivimuokkaajatunnus varchar(150) NULL,
	document_id varchar(255) NULL,
	rauennut timestamp NULL,
	hao_valipaatos_sisalto varchar(1000) NULL,
	kho_valipaatos_sisalto varchar(1000) NULL,
	lainvoimaisuus timestamp NULL,
	osapaatos_annettu timestamp NULL,
	liikenteeseenluovutus_osa timestamp NULL,
	liikenteeseenluovutus_koko timestamp NULL,
	sisratasuunnittelua numeric(38, 10) NULL,
	maantietoimitustehty timestamp NULL,
	CONSTRAINT "TIESUUNNITELMA_pkey" PRIMARY KEY (ts_wid)
);


-- tiesu.tiesuunnitelma_15102020 definition

-- Drop table

-- DROP TABLE tiesu.tiesuunnitelma_15102020;

CREATE TABLE tiesu.tiesuunnitelma_15102020 (
	ts_wid numeric(38) NOT NULL,
	tiesuunnitelma_nro numeric(38) NULL,
	tiesuunnitelma_nimi varchar(1000) NOT NULL,
	kasittelija varchar(500) NULL,
	tiesuunnitelman_kuvaus varchar(1000) NULL,
	diaari varchar(250) NOT NULL,
	ely_keskus varchar(10) NULL,
	status_id numeric(38) NULL,
	hyvaksytty_esitys_laadittu timestamp NULL,
	hyvaksytty_esitys_saapunut timestamp NULL,
	kokonaiskustannukset float8 NULL,
	valtio float8 NULL,
	valtio_osuus float8 NULL,
	kunta float8 NULL,
	kunta_osuus float8 NULL,
	muut float8 NULL,
	muut_osuus float8 NULL,
	indeksivuosiluku numeric(38) NULL,
	maarakennusindeksi numeric(38, 19) NULL,
	maantien_lakkaaminen numeric(38, 10) NULL,
	kiireellinen_kasittely numeric(38, 10) NULL,
	muistutusten_lukumaara numeric(38) NULL,
	ts_kohde_id numeric(38) NULL,
	ts_kohde_id2 numeric(38) NULL,
	selitys varchar(1000) NULL,
	hyvaksytty_paatos_annettu timestamp NULL,
	kasittely_vrk numeric(38) NULL,
	lvm_laadittu timestamp NULL,
	lvm_hyvaksymispaatos timestamp NULL,
	jatkopaatos timestamp NULL,
	osapaatos_annettu timestamp NULL,
	valitusten_maara numeric(38) NULL,
	hao_valipaatoksen_paivamaara varchar(500) NULL,
	hao_kumottu numeric(38, 10) NULL,
	hao_paatoksen_paivamaara timestamp NULL,
	hao_paatoksen_sisalto varchar(1000) NULL,
	kho_valipaatoksen_paivamaara varchar(1000) NULL,
	kho_kumottu numeric(38, 10) NULL,
	kho_paatoksen_paivamaara timestamp NULL,
	kho_paatoksen_sisalto varchar(1000) NULL,
	lainvoimaisuus varchar(1000) NULL,
	lainvoimaisuuden_paattyminen timestamp NULL,
	liikenteeseenluovutus_osa varchar(1000) NULL,
	liikenteeseenluovutus_koko varchar(1000) NULL,
	yva_hanke numeric(38, 10) NULL,
	aloituskuulutus timestamp NULL,
	sahko float8 NULL,
	viestinta float8 NULL,
	vesi float8 NULL,
	jatkopaatos_1_annettu timestamp NULL,
	jatkopaatos_2_annettu timestamp NULL,
	palautettu_elylle timestamp NULL,
	riviluotupvm timestamp NULL,
	rivimuokattupvm timestamp NULL,
	rivimuokkaajatunnus varchar(150) NULL,
	document_id varchar(255) NULL,
	rauennut timestamp NULL,
	hao_valipaatos_sisalto varchar(1000) NULL,
	kho_valipaatos_sisalto varchar(1000) NULL
);


-- tiesu.tiesuunnitelma_kasite_arvo definition

-- Drop table

-- DROP TABLE tiesu.tiesuunnitelma_kasite_arvo;

CREATE TABLE tiesu.tiesuunnitelma_kasite_arvo (
	kasite_wid numeric(38) NOT NULL,
	kasite varchar(100) NULL,
	arvo varchar(200) NULL,
	CONSTRAINT "TIESUUNNITELMA_KASITE_ARVO_pkey" PRIMARY KEY (kasite_wid)
);


-- tiesu.tiesuunnitelmahist_15102020 definition

-- Drop table

-- DROP TABLE tiesu.tiesuunnitelmahist_15102020;

CREATE TABLE tiesu.tiesuunnitelmahist_15102020 (
	rivi_id numeric(38, 10) NOT NULL,
	tunnus numeric(38) NULL,
	suunnitelman_nimi varchar(1000) NULL,
	kasittelija varchar(500) NULL,
	suunnitelman_kuvaus varchar(1000) NULL,
	asianumero varchar(250) NULL,
	ely_keskus varchar(10) NULL,
	status_id numeric(38) NULL,
	hyvaksytty_esitys_laadittu timestamp NULL,
	hyvaksytty_esitys_saapunut timestamp NULL,
	kokonaiskustannukset float8 NULL,
	valtio float8 NULL,
	valtio_osuus float8 NULL,
	kunta float8 NULL,
	kunta_osuus float8 NULL,
	muut float8 NULL,
	muut_osuus float8 NULL,
	indeksivuosiluku numeric(38) NULL,
	maarakennusindeksi numeric(38, 19) NULL,
	maantien_lakkaaminen numeric(38, 10) NULL,
	kiireellinen_kasittely numeric(38, 10) NULL,
	muistutusten_lukumaara numeric(38) NULL,
	kohde_id numeric(38) NULL,
	kohde_id2 numeric(38) NULL,
	selitys varchar(1000) NULL,
	hyvaksytty_paatos_annettu timestamp NULL,
	kasittely_vrk numeric(38) NULL,
	lvm_laadittu timestamp NULL,
	lvm_hyvaksymispaatos timestamp NULL,
	lvm_jatkopaatos timestamp NULL,
	osapaatos_annettu timestamp NULL,
	valitusten_maara numeric(38) NULL,
	hao_valipaatoksen_paivamaara varchar(500) NULL,
	hao_kumottu numeric(38, 10) NULL,
	hao_pvm timestamp NULL,
	hao_sisalto varchar(1000) NULL,
	kho_valipaatoksen_paivamaara varchar(1000) NULL,
	kho_kumottu numeric(38, 10) NULL,
	kho_pvm timestamp NULL,
	kho_sisalto varchar(1000) NULL,
	lainvoimaisuus varchar(1000) NULL,
	lainvoimaisuus_paattyy timestamp NULL,
	liikenteeseenluovutus_osa varchar(1000) NULL,
	liikenteeseenluovutus_koko varchar(1000) NULL,
	yva_hanke numeric(38, 10) NULL,
	aloituskuulutus timestamp NULL,
	sahko float8 NULL,
	viestinta float8 NULL,
	vesi float8 NULL,
	jatkopaatos_1_annettu timestamp NULL,
	jatkopaatos_2_annettu timestamp NULL,
	palautettu_elylle timestamp NULL,
	historiatyyppi varchar(6) NOT NULL,
	rivitunnus numeric(38, 10) NULL,
	rivitila varchar(15) NULL,
	riviluotupvm timestamp NULL,
	rivimuokattupvm timestamp NULL,
	rivimuokkaajatunnus varchar(150) NULL,
	document_id varchar(255) NULL,
	rauennut timestamp NULL,
	hao_valipaatos_sisalto varchar(1000) NULL,
	kho_valipaatos_sisalto varchar(1000) NULL
);


-- tiesu.tiesuunnitelmahistoria definition

-- Drop table

-- DROP TABLE tiesu.tiesuunnitelmahistoria;

CREATE TABLE tiesu.tiesuunnitelmahistoria (
	rivi_id numeric(38, 10) NOT NULL,
	tunnus numeric(38) NULL,
	suunnitelman_nimi varchar(1000) NULL,
	kasittelija varchar(500) NULL,
	suunnitelman_kuvaus varchar(1000) NULL,
	asianumero varchar(250) NULL,
	ely_keskus varchar(10) NULL,
	status_id numeric(38) NULL,
	hyvaksytty_esitys_laadittu timestamp NULL,
	hyvaksytty_esitys_saapunut timestamp NULL,
	kokonaiskustannukset float8 NULL,
	valtio float8 NULL,
	valtio_osuus float8 NULL,
	kunta float8 NULL,
	kunta_osuus float8 NULL,
	muut float8 NULL,
	muut_osuus float8 NULL,
	indeksivuosiluku numeric(38) NULL,
	maarakennusindeksi numeric(38, 19) NULL,
	maantien_lakkaaminen numeric(38, 10) NULL,
	kiireellinen_kasittely numeric(38, 10) NULL,
	muistutusten_lukumaara numeric(38) NULL,
	kohde_id numeric(38) NULL,
	kohde_id2 numeric(38) NULL,
	selitys varchar(1000) NULL,
	hyvaksytty_paatos_annettu timestamp NULL,
	kasittely_vrk numeric(38) NULL,
	lvm_laadittu timestamp NULL,
	lvm_hyvaksymispaatos timestamp NULL,
	lvm_jatkopaatos timestamp NULL,
	old_osapaatos_annettu timestamp NULL,
	valitusten_maara numeric(38) NULL,
	hao_valipaatoksen_paivamaara varchar(500) NULL,
	hao_kumottu numeric(38, 10) NULL,
	hao_pvm timestamp NULL,
	hao_sisalto varchar(1000) NULL,
	kho_valipaatoksen_paivamaara varchar(1000) NULL,
	kho_kumottu numeric(38, 10) NULL,
	kho_pvm timestamp NULL,
	kho_sisalto varchar(1000) NULL,
	old_lainvoimaisuus varchar(1000) NULL,
	lainvoimaisuus_paattyy timestamp NULL,
	old_liikenteeseenluovutus_osa varchar(1000) NULL,
	old_liikenteeseenluovutus_koko varchar(1000) NULL,
	yva_hanke numeric(38, 10) NULL,
	aloituskuulutus timestamp NULL,
	sahko float8 NULL,
	viestinta float8 NULL,
	vesi float8 NULL,
	jatkopaatos_1_annettu timestamp NULL,
	jatkopaatos_2_annettu timestamp NULL,
	palautettu_elylle timestamp NULL,
	historiatyyppi varchar(6) NOT NULL,
	rivitunnus numeric(38, 10) NULL,
	rivitila varchar(15) NULL,
	riviluotupvm timestamp NULL,
	rivimuokattupvm timestamp NULL,
	rivimuokkaajatunnus varchar(150) NULL,
	document_id varchar(255) NULL,
	rauennut timestamp NULL,
	hao_valipaatos_sisalto varchar(1000) NULL,
	kho_valipaatos_sisalto varchar(1000) NULL,
	lainvoimaisuus timestamp NULL,
	osapaatos_annettu timestamp NULL,
	liikenteeseenluovutus_osa timestamp NULL,
	liikenteeseenluovutus_koko timestamp NULL,
	sisratasuunnittelua numeric(38, 10) NULL,
	maantietoimitustehty timestamp NULL,
	CONSTRAINT "TIESUUNNITELMAHISTORIA_pkey" PRIMARY KEY (rivi_id)
);


-- tiesu.ts_kohde definition

-- Drop table

-- DROP TABLE tiesu.ts_kohde;

CREATE TABLE tiesu.ts_kohde (
	kohde_id numeric(38) NOT NULL,
	kohde_selite varchar(100) NULL,
	CONSTRAINT "TS_KOHDE_pkey" PRIMARY KEY (kohde_id)
);


-- tiesu.ts_status definition

-- Drop table

-- DROP TABLE tiesu.ts_status;

CREATE TABLE tiesu.ts_status (
	status_id numeric(38) NOT NULL,
	status_selite varchar(100) NULL,
	readonly numeric(38, 10) NULL,
	CONSTRAINT "TS_STATUS_pkey" PRIMARY KEY (status_id)
);


-- tiesu.yleissuunitelma definition

-- Drop table

-- DROP TABLE tiesu.yleissuunitelma;

CREATE TABLE tiesu.yleissuunitelma (
	ys_wid numeric(38) NOT NULL,
	yleissuunitelman_nro numeric(38) NULL,
	yleissuunnitelman_nimi varchar(1000) NOT NULL,
	kasittelija varchar(100) NULL,
	suunnitelmalaji varchar(500) NULL,
	yleissuunitelman_kuvaus varchar(2000) NULL,
	diaari varchar(60) NOT NULL,
	ely_keskus varchar(50) NULL,
	y_status_id numeric(38) NULL,
	hyvaksytty_esitys_laadittu timestamp NULL,
	hyvaksytty_esitys_saapunut timestamp NULL,
	muistutukset numeric(38) NULL,
	hyvaksytty_paatos_annettu timestamp NULL,
	valitusten_maara numeric(38) NULL,
	selitys varchar(1000) NULL,
	kasittely_vrk numeric(38) NULL,
	old_osapaatos_annettu varchar(500) NULL,
	hao_pvm timestamp NULL,
	hao_sisalto varchar(1000) NULL,
	kho_pvm timestamp NULL,
	kho_sisalto varchar(1000) NULL,
	old_lainvoimaisuus varchar(200) NULL,
	lainvoimasuus_paattyy timestamp NULL,
	raennut varchar(1000) NULL,
	tiesuunnitelma_laadittu varchar(1000) NULL,
	jatkopaatos timestamp NULL,
	yva_hanke numeric(38, 10) NULL,
	kokonaiskustannukset float8 NULL,
	aloituskuulutus timestamp NULL,
	valtio float8 NULL,
	kunta float8 NULL,
	muut float8 NULL,
	sahko float8 NULL,
	viestinta float8 NULL,
	vesi float8 NULL,
	indeksivuosiluku numeric(38) NULL,
	maarakennusindeksi numeric(38, 19) NULL,
	maantien_lakkaaminen numeric(38, 10) NULL,
	kiireellinen_kasittely numeric(38, 10) NULL,
	muistutusten_lukumaara numeric(38) NULL,
	kohde_id numeric(38) NULL,
	kohde_id2 numeric(38) NULL,
	jatkopaatos_1_annettu timestamp NULL,
	jatkopaatos_2_annettu timestamp NULL,
	palautettu_elylle timestamp NULL,
	lvm_laadittu timestamp NULL,
	lvm_hyvaksymispaatos timestamp NULL,
	hao_valipaatoksen_paivamaara varchar(500) NULL,
	hao_kumottu numeric(38, 10) NULL,
	kho_valipaatoksen_paivamaara varchar(1000) NULL,
	kho_kumottu numeric(38, 10) NULL,
	riviluotupvm timestamp NULL,
	rivimuokattupvm timestamp NULL,
	rivimuokkaajatunnus varchar(150) NULL,
	document_id varchar(255) NULL,
	rauennut timestamp NULL,
	hao_valipaatos_sisalto varchar(1000) NULL,
	kho_valipaatos_sisalto varchar(1000) NULL,
	lainvoimaisuus timestamp NULL,
	osapaatos_annettu timestamp NULL,
	CONSTRAINT "YLEISSUUNITELMA_pkey" PRIMARY KEY (ys_wid)
);


-- tiesu.yleissuunitelma_15102020 definition

-- Drop table

-- DROP TABLE tiesu.yleissuunitelma_15102020;

CREATE TABLE tiesu.yleissuunitelma_15102020 (
	ys_wid numeric(38) NOT NULL,
	yleissuunitelman_nro numeric(38) NULL,
	yleissuunnitelman_nimi varchar(1000) NOT NULL,
	kasittelija varchar(100) NULL,
	suunnitelmalaji varchar(500) NULL,
	yleissuunitelman_kuvaus varchar(2000) NULL,
	diaari varchar(60) NOT NULL,
	ely_keskus varchar(50) NULL,
	y_status_id numeric(38) NULL,
	hyvaksytty_esitys_laadittu timestamp NULL,
	hyvaksytty_esitys_saapunut timestamp NULL,
	muistutukset numeric(38) NULL,
	hyvaksytty_paatos_annettu timestamp NULL,
	valitusten_maara numeric(38) NULL,
	selitys varchar(1000) NULL,
	kasittely_vrk numeric(38) NULL,
	osapaatos_annettu varchar(500) NULL,
	hao_pvm timestamp NULL,
	hao_sisalto varchar(1000) NULL,
	kho_pvm timestamp NULL,
	kho_sisalto varchar(1000) NULL,
	lainvoimaisuus varchar(200) NULL,
	lainvoimasuus_paattyy timestamp NULL,
	raennut varchar(1000) NULL,
	tiesuunnitelma_laadittu varchar(1000) NULL,
	jatkopaatos timestamp NULL,
	yva_hanke numeric(38, 10) NULL,
	kokonaiskustannukset float8 NULL,
	aloituskuulutus timestamp NULL,
	valtio float8 NULL,
	kunta float8 NULL,
	muut float8 NULL,
	sahko float8 NULL,
	viestinta float8 NULL,
	vesi float8 NULL,
	indeksivuosiluku numeric(38) NULL,
	maarakennusindeksi numeric(38, 19) NULL,
	maantien_lakkaaminen numeric(38, 10) NULL,
	kiireellinen_kasittely numeric(38, 10) NULL,
	muistutusten_lukumaara numeric(38) NULL,
	kohde_id numeric(38) NULL,
	kohde_id2 numeric(38) NULL,
	jatkopaatos_1_annettu timestamp NULL,
	jatkopaatos_2_annettu timestamp NULL,
	palautettu_elylle timestamp NULL,
	lvm_laadittu timestamp NULL,
	lvm_hyvaksymispaatos timestamp NULL,
	hao_valipaatoksen_paivamaara varchar(500) NULL,
	hao_kumottu numeric(38, 10) NULL,
	kho_valipaatoksen_paivamaara varchar(1000) NULL,
	kho_kumottu numeric(38, 10) NULL,
	riviluotupvm timestamp NULL,
	rivimuokattupvm timestamp NULL,
	rivimuokkaajatunnus varchar(150) NULL,
	document_id varchar(255) NULL,
	rauennut timestamp NULL,
	hao_valipaatos_sisalto varchar(1000) NULL,
	kho_valipaatos_sisalto varchar(1000) NULL
);


-- tiesu.yleissuunnitelma_kasite_arvo definition

-- Drop table

-- DROP TABLE tiesu.yleissuunnitelma_kasite_arvo;

CREATE TABLE tiesu.yleissuunnitelma_kasite_arvo (
	kasite_wid numeric(38) NOT NULL,
	kasite varchar(100) NULL,
	arvo varchar(200) NULL,
	CONSTRAINT "YLEISSUUNNITELMA_KASITE_ARVO_pkey" PRIMARY KEY (kasite_wid)
);


-- tiesu.yleissuunnitelmahist_15102020 definition

-- Drop table

-- DROP TABLE tiesu.yleissuunnitelmahist_15102020;

CREATE TABLE tiesu.yleissuunnitelmahist_15102020 (
	rivi_id numeric(38, 10) NOT NULL,
	tunnus numeric(38) NULL,
	suunnitelman_nimi varchar(1000) NULL,
	kasittelija varchar(100) NULL,
	suunnitelmalaji varchar(500) NULL,
	suunnitelman_kuvaus varchar(2000) NULL,
	asianumero varchar(60) NULL,
	ely_keskus varchar(50) NULL,
	status_id numeric(38) NULL,
	hyvaksytty_esitys_laadittu timestamp NULL,
	hyvaksytty_esitys_saapunut timestamp NULL,
	muistutukset numeric(38) NULL,
	hyvaksytty_paatos_annettu timestamp NULL,
	valitusten_maara numeric(38) NULL,
	selitys varchar(1000) NULL,
	kasittely_vrk numeric(38) NULL,
	osapaatos_annettu varchar(500) NULL,
	hao_pvm timestamp NULL,
	hao_sisalto varchar(1000) NULL,
	kho_pvm timestamp NULL,
	kho_sisalto varchar(1000) NULL,
	lainvoimaisuus varchar(200) NULL,
	lainvoimaisuus_paattyy timestamp NULL,
	raennut varchar(1000) NULL,
	suunnitelma_laadittu varchar(1000) NULL,
	lvm_jatkopaatos timestamp NULL,
	yva_hanke numeric(38, 10) NULL,
	aloituskuulutus timestamp NULL,
	kokonaiskustannukset float8 NULL,
	valtio float8 NULL,
	kunta float8 NULL,
	muut float8 NULL,
	sahko float8 NULL,
	viestinta float8 NULL,
	vesi float8 NULL,
	indeksivuosiluku numeric(38) NULL,
	maarakennusindeksi numeric(38, 19) NULL,
	maantien_lakkaaminen numeric(38, 10) NULL,
	kiireellinen_kasittely numeric(38, 10) NULL,
	muistutusten_lukumaara numeric(38) NULL,
	kohde_id numeric(38) NULL,
	kohde_id2 numeric(38) NULL,
	jatkopaatos_1_annettu timestamp NULL,
	jatkopaatos_2_annettu timestamp NULL,
	palautettu_elylle timestamp NULL,
	lvm_laadittu timestamp NULL,
	lvm_hyvaksymispaatos timestamp NULL,
	hao_valipaatoksen_paivamaara varchar(500) NULL,
	hao_kumottu numeric(38, 10) NULL,
	kho_valipaatoksen_paivamaara varchar(1000) NULL,
	kho_kumottu numeric(38, 10) NULL,
	historiatyyppi varchar(6) NOT NULL,
	rivitunnus numeric(38, 10) NULL,
	rivitila varchar(15) NULL,
	riviluotupvm timestamp NULL,
	rivimuokattupvm timestamp NULL,
	rivimuokkaajatunnus varchar(150) NULL,
	document_id varchar(255) NULL,
	rauennut timestamp NULL,
	hao_valipaatos_sisalto varchar(1000) NULL,
	kho_valipaatos_sisalto varchar(1000) NULL
);


-- tiesu.yleissuunnitelmahistoria definition

-- Drop table

-- DROP TABLE tiesu.yleissuunnitelmahistoria;

CREATE TABLE tiesu.yleissuunnitelmahistoria (
	rivi_id numeric(38, 10) NOT NULL,
	tunnus numeric(38) NULL,
	suunnitelman_nimi varchar(1000) NULL,
	kasittelija varchar(100) NULL,
	suunnitelmalaji varchar(500) NULL,
	suunnitelman_kuvaus varchar(2000) NULL,
	asianumero varchar(60) NULL,
	ely_keskus varchar(50) NULL,
	status_id numeric(38) NULL,
	hyvaksytty_esitys_laadittu timestamp NULL,
	hyvaksytty_esitys_saapunut timestamp NULL,
	muistutukset numeric(38) NULL,
	hyvaksytty_paatos_annettu timestamp NULL,
	valitusten_maara numeric(38) NULL,
	selitys varchar(1000) NULL,
	kasittely_vrk numeric(38) NULL,
	old_osapaatos_annettu varchar(500) NULL,
	hao_pvm timestamp NULL,
	hao_sisalto varchar(1000) NULL,
	kho_pvm timestamp NULL,
	kho_sisalto varchar(1000) NULL,
	old_lainvoimaisuus varchar(200) NULL,
	lainvoimaisuus_paattyy timestamp NULL,
	raennut varchar(1000) NULL,
	suunnitelma_laadittu varchar(1000) NULL,
	lvm_jatkopaatos timestamp NULL,
	yva_hanke numeric(38, 10) NULL,
	aloituskuulutus timestamp NULL,
	kokonaiskustannukset float8 NULL,
	valtio float8 NULL,
	kunta float8 NULL,
	muut float8 NULL,
	sahko float8 NULL,
	viestinta float8 NULL,
	vesi float8 NULL,
	indeksivuosiluku numeric(38) NULL,
	maarakennusindeksi numeric(38, 19) NULL,
	maantien_lakkaaminen numeric(38, 10) NULL,
	kiireellinen_kasittely numeric(38, 10) NULL,
	muistutusten_lukumaara numeric(38) NULL,
	kohde_id numeric(38) NULL,
	kohde_id2 numeric(38) NULL,
	jatkopaatos_1_annettu timestamp NULL,
	jatkopaatos_2_annettu timestamp NULL,
	palautettu_elylle timestamp NULL,
	lvm_laadittu timestamp NULL,
	lvm_hyvaksymispaatos timestamp NULL,
	hao_valipaatoksen_paivamaara varchar(500) NULL,
	hao_kumottu numeric(38, 10) NULL,
	kho_valipaatoksen_paivamaara varchar(1000) NULL,
	kho_kumottu numeric(38, 10) NULL,
	historiatyyppi varchar(6) NOT NULL,
	rivitunnus numeric(38, 10) NULL,
	rivitila varchar(15) NULL,
	riviluotupvm timestamp NULL,
	rivimuokattupvm timestamp NULL,
	rivimuokkaajatunnus varchar(150) NULL,
	document_id varchar(255) NULL,
	rauennut timestamp NULL,
	hao_valipaatos_sisalto varchar(1000) NULL,
	kho_valipaatos_sisalto varchar(1000) NULL,
	lainvoimaisuus timestamp NULL,
	osapaatos_annettu timestamp NULL,
	CONSTRAINT "YLEISSUUNNITELMAHISTORIA_pkey" PRIMARY KEY (rivi_id)
);


-- tiesu.ys_kohde definition

-- Drop table

-- DROP TABLE tiesu.ys_kohde;

CREATE TABLE tiesu.ys_kohde (
	kohde_id numeric(38) NOT NULL,
	kohde_selite varchar(100) NULL,
	CONSTRAINT "YS_KOHDE_pkey" PRIMARY KEY (kohde_id)
);


-- tiesu.ys_status definition

-- Drop table

-- DROP TABLE tiesu.ys_status;

CREATE TABLE tiesu.ys_status (
	status_id numeric(38) NOT NULL,
	selite varchar(300) NULL,
	readonly numeric(38, 10) NULL,
	CONSTRAINT "YS_STATUS_pkey" PRIMARY KEY (status_id)
);