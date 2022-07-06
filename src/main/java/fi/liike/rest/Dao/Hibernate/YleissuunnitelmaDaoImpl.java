package fi.liike.rest.Dao.Hibernate;

import fi.liike.rest.Dao.MainDao;
import fi.liike.rest.Model.Haettava;
import fi.liike.rest.Model.Yleissuunnitelma;
import fi.liike.rest.Model.YleissuunnitelmaHistory;
import fi.liike.rest.Model.YleissuunnitelmaKasite;
import fi.liike.rest.api.DaoContent;
import fi.liike.rest.api.KasiteArvoContent;
import fi.liike.rest.api.ModelResults;
import fi.liike.rest.api.SearchContent;
import org.hibernate.Session;

import java.sql.SQLException;
import java.util.List;

public class YleissuunnitelmaDaoImpl extends SearchDaoImpl implements MainDao {

	@Override
	public ModelResults getFiltered(SearchContent searchContent) {
		return super.getFiltered(Yleissuunnitelma.class, searchContent);
	}

	@Override
	public Haettava get(int id) {
		return get(Yleissuunnitelma.class, id);
	}

	@Override
	public Haettava save(Session session, DaoContent saveContent) throws SQLException {
		return super.save(session, saveContent, "yleissuunitelma_seq", new YleissuunnitelmaHistory());
	}

	@Override
	public Haettava update(Session session, DaoContent content) {
		return super.update(null, content, new YleissuunnitelmaHistory());
	}

	@Override
	public List<KasiteArvoContent> getResources() {
		return super.getResources(YleissuunnitelmaKasite.class);
	}

	@Override
	public List<Haettava> getAll() {
		return super.getAll(Yleissuunnitelma.class);
	}

	@Override
	public void delete(int id, DaoContent deleteContent, String remoteUser) throws SQLException {
		super.delete(Yleissuunnitelma.class, YleissuunnitelmaHistory.class, id, new YleissuunnitelmaHistory(), deleteContent, remoteUser);
	}

}
