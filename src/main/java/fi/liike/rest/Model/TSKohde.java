package fi.liike.rest.Model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="ts_kohde")
public class TSKohde extends Haettava implements Serializable {

    /**
     * 
     */
    private static final long serialVersionUID = 1L;

	@Id
	@Column(name="STATUS_ID", unique = true, nullable = false)
	private Integer status_id;	

    @Column(name="STATUS_SELITE")
    private String status_selite;
	
	public Integer getStatus_id() {
		return status_id;
	}

	public void setStatus_id(Integer status_id) {
		this.status_id = status_id;
	}

	public String getStatus_selite() {
		return status_selite;
	}

	public void setStatus_selite(String status_selite) {
		this.status_selite = status_selite;
	}
	
	public Integer getReadonly() {
		return 0;
	}

	@Override
	public String toString() {
		return "TSKohde[status_id=" + status_id + ", status_selite=" + status_selite + "]";
	}

}
