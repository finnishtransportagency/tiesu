package fi.liike.rest.Dao.Hibernate;

import com.google.common.collect.ImmutableSet;
import fi.liike.rest.Dao.HibernateDao;
import fi.liike.rest.Model.*;
import fi.liike.rest.api.ModelResults;
import fi.liike.rest.api.SearchContent;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Disjunction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.lang.reflect.Field;
import java.util.*;

public class SearchDaoImpl extends HibernateDao {
    private final Logger LOG = LoggerFactory.getLogger(SearchDaoImpl.class);

    public ModelResults getFiltered(Class<? extends Haettava> className, SearchContent searchContent) {
        LOG.info("Fetching filtered " + className + " ModelResults");
        Criteria criteria = createBasicSearch(className, searchContent);
        int totalCount = list(criteria).size();
        setPaging(criteria, searchContent);
        List<Haettava> result = list(criteria);
        closeSession();
        return new ModelResults(result, totalCount);
    }

    private Criteria createBasicSearch(Class<? extends Haettava> className, SearchContent searchContainer) {
        Session session = getSession();
        Criteria crit = session.createCriteria(className);
        Order order = searchContainer.getSort().equals("asc") ? Order.asc("nimi").ignoreCase()
                : Order.desc("nimi").ignoreCase();
        crit.addOrder(order);

        Set<String> searchFields = ImmutableSet.of("nimi", "kuvaus", "asianumero");
        for (String filter : searchContainer.getFilter()) {
            if (filter.length() > 0) {
                addDisjunctionToCriteria(className, searchFields, crit, filter, session);
            }
        }

        for (Map.Entry<String, List<String>> field : searchContainer.getFields().entrySet())
            addRestriction(crit, field.getKey(), field.getValue());

        Date modAfterDate = searchContainer.getModAfterDate();
        if (modAfterDate != null) {
            crit.add(Restrictions.ge("rivimuokattupvm", modAfterDate));
        }

        Boolean filterDisabled = searchContainer.getFilterDisabled();
        if (filterDisabled != null) {
            crit.add(Restrictions.eq("poistunut", 0));
        }

        return crit;
    }

    private void addRestriction(Criteria criteria, String fieldName, List<String> values) {
        if (values != null && !values.isEmpty()) {
            Disjunction disjunction = Restrictions.disjunction();
            for (String value : values) {
                disjunction.add(Restrictions.eq(fieldName, value).ignoreCase());
            }
            criteria.add(disjunction);
        }
    }

    private void addDisjunctionToCriteria(Class<? extends Haettava> className, Set<String> fields, Criteria crit,
                                          String filter, Session session) {
        Disjunction disjunction = Restrictions.disjunction();

        //Search system properties
        Field[] classFields = className.getDeclaredFields();
        for (String field : fields) {
            Boolean classHasCurrField = classHasField(classFields, field);
            if (classHasCurrField) {
                disjunction.add(Restrictions.ilike(field, "%" + filter + "%"));
            }
        }

        crit.add(disjunction);
    }

    private Boolean classHasField(Field[] classFields, String field) {
        for (Field classField : classFields) {
            if (classField.getName().equals(field)) {
                return true;
            }
        }
        return false;
    }

    private void setPaging(Criteria criteria, SearchContent searchContent) {
        if (searchContent.getSize() >= 0)
            criteria.setMaxResults(searchContent.getSize());

        if (searchContent.getOffset() >= 0)
            criteria.setFirstResult(searchContent.getOffset());
    }
}
