package fi.liike.rest.Dao.Hibernate;

import fi.liike.rest.Dao.MainDao;
import fi.liike.rest.Model.Haettava;
import fi.liike.rest.Model.RataSuunnitelma;
import fi.liike.rest.Model.RataSuunnitelmaHistory;
import fi.liike.rest.Model.RataSuunnitelmaKasite;
import fi.liike.rest.api.DaoContent;
import fi.liike.rest.api.KasiteArvoContent;
import fi.liike.rest.api.ModelResults;
import fi.liike.rest.api.SearchContent;
import org.hibernate.Session;

import java.sql.SQLException;
import java.util.List;

public class RataSuunnitelmaDaoImpl extends SearchDaoImpl implements MainDao {

	@Override
	public ModelResults getFiltered(SearchContent searchContent) {
		return super.getFiltered(RataSuunnitelma.class, searchContent);
	}

	@Override
	public Haettava get(int id) {
		return get(RataSuunnitelma.class, id);
	}

	@Override
	public Haettava save(Session session, DaoContent saveContent) throws SQLException {
		return super.save(session, saveContent, "RATASUUNNITELMA_SEQ", new RataSuunnitelmaHistory());
	}

	@Override
	public Haettava update(Session session, DaoContent content) {
		return super.update(null, content, new RataSuunnitelmaHistory());
	}

	@Override
	public List<KasiteArvoContent> getResources() {
		return super.getResources(RataSuunnitelmaKasite.class);
	}

	@Override
	public List<Haettava> getAll() {
		return super.getAll(RataSuunnitelma.class);
	}

	@Override
	public void delete(int id, DaoContent deleteContent, String remoteUser) throws SQLException {
		super.delete(RataSuunnitelma.class, RataSuunnitelmaHistory.class, id, new RataSuunnitelmaHistory(), deleteContent, remoteUser);
	}

}
