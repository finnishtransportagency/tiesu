package fi.liike.dao;

import fi.liike.rest.Dao.JoinDao;
import fi.liike.rest.Model.JoinTable;
import fi.liike.rest.api.JoinCategory;
import fi.liike.testutils.TestDbUtil;

public class MainDaoTester {

	public MainDaoTester(JoinCategory category) {
		TestDbUtil.init();
		switch (category) {
		default:
			break;
		}
	}

	public void clear() {
		TestDbUtil.clearJoinTableDB(JoinCategory.LOOGINENFYYSINEN);
	}


}
