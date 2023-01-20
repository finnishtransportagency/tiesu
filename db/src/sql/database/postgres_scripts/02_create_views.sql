-- tiesutst.palvelupaikat_latest source

CREATE OR REPLACE VIEW tiesutst.palvelupaikat_latest
AS SELECT foo.nimi,
    foo.lyhenne,
    foo.rataosa,
    foo.tyyppi,
    foo.henkiloliikenne,
    foo.tavaraliikenne,
    foo.kaukoohjaus,
    foo.liikennepaikan_ohitus,
    foo.lahto_maara,
    foo.veturin_huoltoon_sta,
    foo.manuaalivaihdetyo_tarvitaan,
    foo.rajoitevaihtokulkutienmuodost,
    foo.ratatyon_turvaus,
    foo.urakoitsija_finrail,
    foo.urakoitsija_vr,
    foo.urakoitsija_joku_muu,
    foo.huomautus,
    foo.lisamiehityksen_tilaus,
    foo.created,
    foo.last_modified_date,
    foo.last_modified_by,
    foo.username,
    foo.form_version AS "
form_version",
    foo.document_id,
    foo.deleted,
    foo.app,
    foo.form,
    foo.recency
   FROM ( SELECT palvelupaikat.nimi,
            palvelupaikat.lyhenne,
            palvelupaikat.rataosa,
            palvelupaikat.tyyppi,
            palvelupaikat.henkiloliikenne,
            palvelupaikat.tavaraliikenne,
            palvelupaikat.kaukoohjaus,
            palvelupaikat.liikennepaikan_ohitus,
            palvelupaikat.lahto_maara,
            palvelupaikat.veturin_huoltoon_sta,
            palvelupaikat.manuaalivaihdetyo_tarvitaan,
            palvelupaikat.rajoitevaihtokulkutienmuodost,
            palvelupaikat.ratatyon_turvaus,
            palvelupaikat.urakoitsija_finrail,
            palvelupaikat.urakoitsija_vr,
            palvelupaikat.urakoitsija_joku_muu,
            palvelupaikat.huomautus,
            palvelupaikat.lisamiehityksen_tilaus,
            palvelupaikat.created,
            palvelupaikat.last_modified_date,
            palvelupaikat.last_modified_by,
            palvelupaikat.username,
            palvelupaikat.form_version,
            palvelupaikat.document_id,
            palvelupaikat.deleted,
            palvelupaikat.app,
            palvelupaikat.form,
            row_number() OVER (PARTITION BY palvelupaikat.document_id ORDER BY palvelupaikat.last_modified_date DESC) AS recency
           FROM tiesutst.palvelupaikat) foo
  WHERE foo.recency = 1 AND foo.deleted::text = 'n'::text;

-- Permissions

ALTER TABLE tiesutst.palvelupaikat_latest OWNER TO tietokatalogidev;
GRANT ALL ON TABLE tiesutst.palvelupaikat_latest TO tietokatalogidev;
GRANT SELECT ON TABLE tiesutst.palvelupaikat_latest TO cognos;