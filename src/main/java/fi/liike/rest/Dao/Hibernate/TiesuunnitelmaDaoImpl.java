package fi.liike.rest.Dao.Hibernate;

import fi.liike.rest.Dao.MainDao;
import fi.liike.rest.Model.Haettava;
import fi.liike.rest.Model.TiesuunnitelmaKasite;
import fi.liike.rest.Model.Tiesuunnitelma;
import fi.liike.rest.Model.TiesuunnitelmaHistory;
import fi.liike.rest.Model.TSKohde;
import fi.liike.rest.Model.TSStatus;
import fi.liike.rest.api.DaoContent;
import fi.liike.rest.api.KasiteArvoContent;
import fi.liike.rest.api.ModelResults;
import fi.liike.rest.api.SearchContent;
import org.hibernate.Session;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TiesuunnitelmaDaoImpl extends SearchDaoImpl implements MainDao {

	@Override
	public ModelResults getFiltered(SearchContent searchContent) {
		return super.getFiltered(Tiesuunnitelma.class, searchContent);
	}

	@Override
	public Haettava get(int id) {
		return get(Tiesuunnitelma.class, id);
	}

	@Override
	public Haettava save(Session session, DaoContent saveContent) throws SQLException {
		return super.save(session, saveContent, "tiesuunnitelma_seq", new TiesuunnitelmaHistory());
	}

	@Override
	public Haettava update(Session session, DaoContent content) {
		return super.update(null, content, new TiesuunnitelmaHistory());
	}
	
	@Override
	public List<KasiteArvoContent> getResources() {
		List<KasiteArvoContent> resources = super.getResources(TiesuunnitelmaKasite.class);
		resources.addAll(getLinkResources(TSKohde.class, "Kohde"));
		resources.addAll(getLinkResources(TSStatus.class, "Status"));

		return resources;
	}
	
	private List<KasiteArvoContent> getLinkResources(Class<? extends Haettava> className, String resourceName) {
		List<Haettava> linkList = super.getAll(className);
		List<KasiteArvoContent> kasiteArvoContentList = new ArrayList<KasiteArvoContent>();

		for (Haettava link : linkList) {
			Integer id = link.getTunnus();
			String name = link.getNimi();
			//Integer readonly = link.getReadonly();

			if (name != null && !name.equals("")) {
				KasiteArvoContent kasiteArvoContent = new KasiteArvoContent(id, resourceName, name);
				kasiteArvoContentList.add(kasiteArvoContent);
			}
		}
		return kasiteArvoContentList;
	}

	@Override
	public List<Haettava> getAll() {
		return super.getAll(Tiesuunnitelma.class);
	}

	@Override
	public void delete(int id, DaoContent deleteContent, String remoteUser) throws SQLException {
		super.delete(Tiesuunnitelma.class, TiesuunnitelmaHistory.class, id, new TiesuunnitelmaHistory(), deleteContent, remoteUser);
	}

}
