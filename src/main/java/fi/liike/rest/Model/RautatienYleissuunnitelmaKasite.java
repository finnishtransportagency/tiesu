package fi.liike.rest.Model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "RT_YLEIS_KASITE_ARVO")
public class RautatienYleissuunnitelmaKasite extends KasiteArvo implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "KASITE_ID", unique = true, nullable = false)
	private int id;

	@Column(name = "KASITE")
	private String kasite;

	@Column(name = "ARVO")
	private String arvo;

	@Override
	public String getKasite() {
		return kasite;
	}

	@Override
	public String getArvo() {
		return arvo;
	}

	@Override
	public Integer getId() {
		return id;
	}

	@Override
	public String toString() {
		return "RautatienYleissuunnitelmaKasite: Kasite: " + kasite + " Arvo: " + arvo;
	}
}
