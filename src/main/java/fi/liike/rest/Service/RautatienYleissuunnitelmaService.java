package fi.liike.rest.Service;

import fi.liike.rest.Dao.Hibernate.RautatienYleissuunnitelmaDaoImpl;
import fi.liike.rest.Dao.MainDao;
import fi.liike.rest.api.*;
import fi.liike.rest.api.dto.RautatienYleissuunnitelmaConverter;
import org.hibernate.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.SQLException;
import java.util.List;

public class RautatienYleissuunnitelmaService extends MainService implements Service {

	private MainDao dao;
	private RautatienYleissuunnitelmaConverter converter;
	private final Logger LOG = LoggerFactory.getLogger(RautatienYleissuunnitelmaService.class);

	public RautatienYleissuunnitelmaService() {
		dao = new RautatienYleissuunnitelmaDaoImpl();
		converter = new RautatienYleissuunnitelmaConverter();
	}

	@Override
	public ContentDto save(ContentDto content) throws SQLException {
		return save(null, content);
	}

	@Override
	public ContentDto save(Session session, ContentDto content) throws SQLException {
		DaoContent saveContent = new DaoContent();
		saveContent.setHaettava(converter.dtoToDomain(content));
		return converter.modelToDto(dao.save(session, saveContent));
	}

	@Override
	public ContentDto update(ContentDto content) {
		return update(null, content);
	}

	@Override
	public ContentDto update(Session session, ContentDto content) {
		DaoContent saveContent = new DaoContent();
		saveContent.setHaettava(converter.dtoToDomain(content));
		return converter.modelToDto(dao.update(session, saveContent));
	}

	@Override
	public Integer delete(int id, String remoteUser) {
		try {
			dao.delete(id, null, remoteUser);
			return id;
		} catch (SQLException e) {
			LOG.error("Unable to do a delete transaction. Error message: " + e.getMessage());
			return null;
		}
	}

	@Override
	public DtoResults getFiltered(SearchContent searchContent) {
		return super.getFiltered(converter, dao, searchContent);
	}

	@Override
	public ContentDto get(int id) {
		return super.get(converter, dao, id);
	}

	@Override
	public List<KasiteArvoContent> getResources() {
		return dao.getResources();
	}

	@Override
	public List<ContentDto> getAll() {
		return super.getAll(converter, dao);
	}
}
