package fi.liike.rest.Dao.Hibernate;

import fi.liike.rest.Dao.MainDao;
import fi.liike.rest.Model.Haettava;
import fi.liike.rest.Model.RautatienYleissuunnitelma;
import fi.liike.rest.Model.RautatienYleissuunnitelmaHistory;
import fi.liike.rest.Model.RautatienYleissuunnitelmaKasite;
import fi.liike.rest.api.DaoContent;
import fi.liike.rest.api.KasiteArvoContent;
import fi.liike.rest.api.ModelResults;
import fi.liike.rest.api.SearchContent;
import org.hibernate.Session;

import java.sql.SQLException;
import java.util.List;

public class RautatienYleissuunnitelmaDaoImpl extends SearchDaoImpl implements MainDao {

	@Override
	public ModelResults getFiltered(SearchContent searchContent) {
		return super.getFiltered(RautatienYleissuunnitelma.class, searchContent);
	}

	@Override
	public Haettava get(int id) {
		return get(RautatienYleissuunnitelma.class, id);
	}

	@Override
	public Haettava save(Session session, DaoContent saveContent) throws SQLException {
		return super.save(session, saveContent, "rautatien_yleissuunnitelma_seq", new RautatienYleissuunnitelmaHistory());
	}

	@Override
	public Haettava update(Session session, DaoContent content) {
		return super.update(null, content, new RautatienYleissuunnitelmaHistory());
	}

	@Override
	public List<KasiteArvoContent> getResources() {
		return super.getResources(RautatienYleissuunnitelmaKasite.class);
	}

	@Override
	public List<Haettava> getAll() {
		return super.getAll(RautatienYleissuunnitelma.class);
	}

	@Override
	public void delete(int id, DaoContent deleteContent, String remoteUser) throws SQLException {
		super.delete(RautatienYleissuunnitelma.class, RautatienYleissuunnitelmaHistory.class, id, new RautatienYleissuunnitelmaHistory(), deleteContent, remoteUser);
	}

}
