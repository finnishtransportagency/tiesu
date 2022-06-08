package fi.liike.rest;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.ws.rs.core.Response;

import fi.liike.rest.Model.*;
import fi.liike.rest.api.dto.*;
import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONException;

import fi.liike.rest.Controller.MainController;
import fi.liike.rest.api.Catalogue;
import fi.liike.rest.api.ContentDto;
import fi.liike.rest.api.HistoryType;
import fi.liike.rest.api.JoinCategory;
import fi.liike.testutils.TestDbUtil;
import fi.liike.testutils.TestRequest;
import fi.liike.testutils.TestUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class MainRestTester {
	private static final Logger LOG = LoggerFactory.getLogger(MainRestTester.class);

	public MainRestTester(Catalogue catalogue) {
		TestDbUtil.init();
		switch (catalogue) {
		default:
			break;
		}
	}

	public void clear() {
		TestDbUtil.close();
	}

	public void testDelete(Catalogue catalogue) {
		Class<? extends Haettava> className = getMainClass(catalogue);
		Class<? extends HaettavaHistory> historyClassName = getHistoryClass(catalogue);
		try {
			TestDbUtil.writeToDb(TestUtil.createEntriesInJson(catalogue, 5));
		} catch (JSONException e) {
			LOG.error("There was an error: " + e.getMessage());
		}
		MainController rest = TestUtil.getRest(catalogue);
		ExtractedResponse response = new ExtractedResponse(getAll(catalogue, "30", "0", null, "asc"));

		List<Object> ids = response.getValues("items", "tunnus");
		assertTrue(TestDbUtil.isRowInDb(className, 1));
		assertTrue(response.contains(ids, 1));

		// delete existing id
		rest.delete(new TestRequest(), "1");
		response = new ExtractedResponse(getAll(catalogue, "30", "0", null, "asc"));
		assertFalse(TestDbUtil.isRowInDb(className, 1));
		assertTrue(TestDbUtil.isRowInHistoryTableDb(historyClassName, 1, HistoryType.DEL));
		assertEquals(200, response.getStatus());

		// delete inactive id
		Response deleteResponse = rest.delete(new TestRequest(), "1");
		assertEquals(500, deleteResponse.getStatus());

		// delete non-existing id
		deleteResponse = rest.delete(new TestRequest(), "101");
		assertEquals(500, deleteResponse.getStatus());

		// invalid parameter
		deleteResponse = rest.delete(new TestRequest(), "test");
		assertEquals(400, deleteResponse.getStatus());
	}

	public void testUpdate(Catalogue catalogue) throws JSONException, IOException {
		Class<? extends Haettava> className = getMainClass(catalogue);
		Class<? extends HaettavaHistory> historyClassName = getHistoryClass(catalogue);

		// - Create new
		ContentDto newEntry = TestUtil.createEntry(catalogue);
		MainController rest = TestUtil.getRest(catalogue);
		ExtractedResponse response = new ExtractedResponse(rest.create(new TestRequest(), newEntry));
		List<? extends HaettavaHistory> historyDbRows = TestDbUtil.getHaettavaHistoryRowsFromDb(historyClassName);
		assertEquals("TestUser", historyDbRows.get(0).getRivimuokkaajatunnus());

		// - Update existing entry with id
		// -> Check that entry row is updated
		// -> Check that new row in a history table exist with type MOD.
		String newName = "Updated content 1";
		newEntry.setNimi(newName);
		newEntry.setTunnus((Integer) response.getValue("tunnus"));

		ExtractedResponse updateResponse = new ExtractedResponse(rest.update(new TestRequest(), newEntry));

		assertEquals(200, updateResponse.getStatus());
		Haettava entry2 = TestDbUtil.getHaettavaRowsFromDb(className).get(0);
		assertEquals(newName, entry2.getNimi());
		List<? extends HaettavaHistory> historyRows = TestDbUtil.getHaettavaHistoryRowsFromDb(historyClassName);
		assertEquals(HistoryType.MOD, historyRows.get(0).getHistoriatyyppi());
		assertFalse(historyRows.get(0).getRiviluotupvm().equals(historyRows.get(1).getRiviluotupvm()));
		assertEquals(2, historyRows.size());
		assertEquals("TestUser", historyRows.get(0).getRivimuokkaajatunnus());

		// - Test that non-existing id is not possible to update
		newEntry.setTunnus(99999);
		updateResponse = new ExtractedResponse(rest.update(new TestRequest(), newEntry));
		assertEquals(500, updateResponse.getStatus());
	}

	public void testUpdateInactive(Catalogue catalogue) throws JSONException, IOException {
		TestDbUtil.writeToDb(TestUtil.createInactiveEntriesInJson(catalogue, 1, 1));
		ContentDto newEntry = TestUtil.createEntry(catalogue);
		MainController rest = TestUtil.getRest(catalogue);

		newEntry.setTunnus(1);
		ExtractedResponse updateResponse = new ExtractedResponse(rest.update(new TestRequest(), newEntry));
		assertEquals(500, updateResponse.getStatus());
	}

	public <T extends Haettava> void testCreateNew(Catalogue catalogue) throws IOException {
		ContentDto firstEntry = TestUtil.createEntry(catalogue);
		testCreateNew(catalogue, firstEntry, true);
	}

	public <T extends Haettava> void testCreateNew(Catalogue catalogue, ContentDto firstEntry, Boolean assertIdValue) throws IOException {
		Class<? extends Haettava> className = getMainClass(catalogue);
		Class<? extends HaettavaHistory> historyClassName = getHistoryClass(catalogue);
		TestDbUtil.writeToDb(TestUtil.createActiveEntriesInJson(catalogue, 2, 5));

		assertNull(firstEntry.getTunnus());
		MainController rest = TestUtil.getRest(catalogue);
		ExtractedResponse response = new ExtractedResponse(rest.create(new TestRequest(), firstEntry));
		Integer id = (Integer) response.getValue("tunnus");

		List<? extends Haettava> dbRows = TestDbUtil.getHaettavaRowsFromDb(className);
		Haettava haettava = dbRows.get(0);
		assertEquals("TestUser", haettava.getRivimuokkaajatunnus());
		if (assertIdValue) {
			assertEquals(1, (int) id);
		} else {
			assertEquals(true, id != null);
		}

		assertTrue(TestDbUtil.isRowInDb(className, id));
		assertTrue(TestDbUtil.isRowInHistoryTableDb(historyClassName, id, HistoryType.ADD));
		List<? extends HaettavaHistory> historyDbRows = TestDbUtil.getHaettavaHistoryRowsFromDb(historyClassName);
		assertEquals("TestUser", historyDbRows.get(0).getRivimuokkaajatunnus());

		// Test auto-increment for id.
		// If next id is reserved next free one should be used.
		// In test data id 2 is reserved.
		ContentDto secondEntry = TestUtil.createEntry(catalogue);
		response = new ExtractedResponse(rest.create(new TestRequest(), secondEntry));
		id = (Integer) response.getValue("tunnus");
		if (assertIdValue) {
			assertEquals(7, (int) id);
		} else {
			assertEquals(true, id != null);
		}
		assertTrue(TestDbUtil.isRowInDb(className, id));
		assertTrue(TestDbUtil.isRowInHistoryTableDb(historyClassName, id, HistoryType.ADD));
		historyDbRows = TestDbUtil.getHaettavaHistoryRowsFromDb(historyClassName);
		assertEquals("TestUser", historyDbRows.get(0).getRivimuokkaajatunnus());

		// Deleted item's id is not allowed to be reused
		rest.delete(new TestRequest(), "7");
		ContentDto deleteTestEntry = TestUtil.createEntry(catalogue);
		response = new ExtractedResponse(rest.create(new TestRequest(), deleteTestEntry));
		id = (Integer) response.getValue("tunnus");
		if (assertIdValue) {
			assertEquals(8, (int) id);
		} else {
			assertEquals(true, id != null);
		}
	}

	public void testPaging(Catalogue catalogue) {
		try {
			TestDbUtil.writeToDb(TestUtil.createEntriesInJson(catalogue, 100));
		} catch (JSONException e) {
			LOG.error("There was an error: " + e.getMessage());
		}
		ExtractedResponse response = new ExtractedResponse(getAll(catalogue, "30", "0", null, null));
		JSONArray items = response.getItems();
		int count = (Integer) response.getValue("count");
		List<Object> values = response.getValues("items", "nimi");
		assertTrue(values.contains("a05"));
		assertFalse(values.contains("a35"));
		assertEquals(30, items.length());
		assertEquals(100, count);
		assertEquals(200, response.getStatus());

		response = new ExtractedResponse(getAll(catalogue, "30", "30", null, null));
		items = response.getItems();
		values = response.getValues("items", "nimi");
		assertTrue(values.contains("a35"));
		assertFalse(values.contains("a05"));
		assertEquals(30, items.length());
		assertEquals(200, response.getStatus());

		response = new ExtractedResponse(getAll(catalogue, "300", "0", null, null));
		items = response.getItems();
		values = response.getValues("items", "nimi");
		assertTrue(values.contains("a35"));
		assertTrue(values.contains("a05"));
		assertTrue(values.contains("a99"));
		assertEquals(100, items.length());
		assertEquals(200, response.getStatus());

		response = new ExtractedResponse(getAll(catalogue, "300", "300", null, null));
		assertEquals(0, response.getItems().length());
	}

	public void testGetEntry(Catalogue catalogue) {
		try {
			TestDbUtil.writeToDb(TestUtil.createEntriesInJson(catalogue, 100));
		} catch (JSONException e) {
			LOG.error("There was an error: " + e.getMessage());
		}
		// Existing item
		ExtractedResponse response = new ExtractedResponse(getEntry(catalogue, "1"));
		int id = (Integer) response.getValue("tunnus");
		assertEquals(1, id);
		assertEquals(200, response.getStatus());
		// Non-existing item
		response = new ExtractedResponse(getEntry(catalogue, "500"));
		assertEquals(500, response.getStatus());
		// Invalid parameter
		response = new ExtractedResponse(getEntry(catalogue, "invalid"));
		assertEquals(400, response.getStatus());
	}

	public void getKasite(Catalogue catalogue, boolean createEntries, List<String> testWords) {
		if (createEntries) {
			TestDbUtil.writeToDb(TestUtil.createKasiteEntriesInJson(catalogue));
			testWords = new ArrayList<String>();
			testWords.add("kasite1");
			testWords.add("kasite2");
			testWords.add("kasite3");
			testWords.add("kasite4");
			testWords.add("kasite5");
		}
		MainController rest = TestUtil.getRest(catalogue);
		ExtractedResponse response = new ExtractedResponse(rest.getKasite());
		List<Object> references = response.getValues("resources", "resourceName");
		for (String word : testWords) {
			assertTrue(references.contains(word));
		}
	}

	public void testCreateLink(Catalogue catalogue, String parentLinkName, Class<? extends JoinHistory> className) throws IOException {
		setupDb(catalogue);

		ContentDto childNode = TestUtil.createEntry(catalogue);
		childNode.setNimi("testi");
		setParentNode(catalogue, childNode, 2);

		MainController rest = TestUtil.getRest(catalogue);
		ExtractedResponse response = new ExtractedResponse(rest.create(new TestRequest(), childNode));
		int parentNodeId = (Integer) response.getValue(parentLinkName);
		int childNodeId = (Integer) response.getValue("tunnus");

		List<? extends JoinHistory> historyRows = TestDbUtil.getJoinHistoryRowsFromDb(className);
		assertEquals(1, historyRows.size());
		JoinHistory history = historyRows.get(0);
		assertTrue(HistoryType.ADD.equals(history.getHistoriatyyppi()));
		assertEquals(childNodeId, (int) history.getChildNode());
		assertEquals(parentNodeId, (int) history.getParentNode());
		assertEquals("TestUser", history.getRivimuokkaajatunnus());

		response = new ExtractedResponse(rest.get("1"));
		parentNodeId = (Integer) response.getValue(parentLinkName);
		assertEquals(2, parentNodeId);
	}


	public void testUpdateParentLink(Catalogue catalogue, String parentLinkName,
			Class<? extends JoinHistory> className) throws IOException {
		setupDb(catalogue);

		ContentDto childNode = TestUtil.createEntry(catalogue);
		childNode.setNimi("testi");
		setParentNode(catalogue, childNode, 2);

		MainController rest = TestUtil.getRest(catalogue);

		ExtractedResponse response = new ExtractedResponse(rest.create(new TestRequest(), childNode));

		int parentNodeId = (Integer) response.getValue(parentLinkName);
		int childNodeId = (Integer) response.getValue("tunnus");

		List<? extends JoinHistory> rows = TestDbUtil.getJoinHistoryRowsFromDb(className);
		assertEquals(1, rows.size());
		JoinHistory entryFromDb = rows.get(0);
		assertEquals(HistoryType.ADD, entryFromDb.getHistoriatyyppi());
		assertEquals(1, (int) entryFromDb.getChildNode());
		assertEquals(2, (int) entryFromDb.getParentNode());
		assertEquals("TestUser", entryFromDb.getRivimuokkaajatunnus());
		assertNotNull(entryFromDb.getRiviluotupvm());

		childNode.setTunnus(childNodeId);
		setParentNode(catalogue, childNode, 3);

		rest.update(new TestRequest(), childNode);

		response = new ExtractedResponse(rest.get(Integer.toString(childNodeId)));
		parentNodeId = (Integer) response.getValue(parentLinkName);
		assertEquals(3, parentNodeId);

		rows = TestDbUtil.getJoinHistoryRowsFromDb(className);
		assertEquals(2, rows.size());
		JoinHistory firstEntryFromDb = rows.get(1);
		assertEquals(HistoryType.ADD, firstEntryFromDb.getHistoriatyyppi());
		assertEquals(1, (int) firstEntryFromDb.getChildNode());
		assertEquals(2, (int) firstEntryFromDb.getParentNode());
		assertNotNull(firstEntryFromDb.getRiviluotupvm());

		JoinHistory secondEntryFromDb = rows.get(0);
		assertEquals(HistoryType.ADD, entryFromDb.getHistoriatyyppi());
		assertEquals(1, (int) secondEntryFromDb.getChildNode());
		assertEquals(3, (int) secondEntryFromDb.getParentNode());
		assertNotNull(secondEntryFromDb.getRiviluotupvm());
	}

	public void deleteParentLink(Catalogue catalogue, String parentLinkName,
			Class<? extends JoinHistory> historyClassName, Class<? extends JoinTable> joinClassName) throws IOException {
		setupDb(catalogue);

		ContentDto childNode = TestUtil.createEntry(catalogue);
		childNode.setNimi("testi");
		setParentNode(catalogue, childNode, 2);

		MainController rest = TestUtil.getRest(catalogue);

		ExtractedResponse response = new ExtractedResponse(rest.create(new TestRequest(), childNode));
		int parentNodeId = (Integer) response.getValue(parentLinkName);
		int childNodeId = (Integer) response.getValue("tunnus");

		List<? extends JoinHistory> historyRows = TestDbUtil.getJoinHistoryRowsFromDb(historyClassName);
		assertEquals(1, historyRows.size());
		JoinHistory history = historyRows.get(0);
		assertEquals(HistoryType.ADD, history.getHistoriatyyppi());

		assertEquals(childNodeId, (int) history.getChildNode());
		assertEquals(parentNodeId, (int) history.getParentNode());
		List<? extends JoinTable> joins = TestDbUtil.getJoinRowsFromDb(joinClassName);
		assertEquals(1, joins.size());

		rest.delete(new TestRequest(), Integer.toString(childNodeId));
		joins = TestDbUtil.getJoinRowsFromDb(joinClassName);
		assertEquals(0, joins.size());
		historyRows = TestDbUtil.getJoinHistoryRowsFromDb(historyClassName);
		history = historyRows.get(0);
		assertEquals(HistoryType.DEL, history.getHistoriatyyppi());
		assertEquals(childNodeId, (int) history.getChildNode());
		assertEquals(parentNodeId, (int) history.getParentNode());
		assertEquals("TestUser", history.getRivimuokkaajatunnus());
	}

	private Response getAll(Catalogue catalogue, String size, String offset, String filter, String order) {
		switch (catalogue) {

		default:
			return null;
		}
	}

	private Response getEntry(Catalogue catalogue, String id) {
		return TestUtil.getRest(catalogue).get(id);
	}

	private void setParentNode(Catalogue catalogue, ContentDto childNode, int parentId) {
		switch (catalogue) {

		default:
			break;
		}
	}

	private void setupDb(Catalogue catalogue) {
		switch (catalogue) {

		default:
			break;
		}
	}

	private Class<? extends Haettava> getMainClass(Catalogue catalogue) {
		switch (catalogue) {

		default:
			return null;
		}
	}

	private Class<? extends HaettavaHistory> getHistoryClass(Catalogue catalogue) {
		switch (catalogue) {

		default:
			return null;
		}
	}

}
