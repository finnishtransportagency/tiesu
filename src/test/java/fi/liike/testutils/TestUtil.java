package fi.liike.testutils;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.*;

import com.google.common.collect.ImmutableMap;
import org.apache.commons.lang.StringUtils;
import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;


import fi.liike.rest.Controller.MainController;

import fi.liike.rest.api.Catalogue;
import fi.liike.rest.api.ContentDto;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class TestUtil {
	private static final Logger LOG = LoggerFactory.getLogger(TestUtil.class);

	public static JSONArray getJsonArray(String filePath) {
		try {
			String string = readFile(filePath);
			return new JSONArray(string);
		} catch (JSONException e) {
			LOG.error("There was an error: " + e.getMessage());
		}
		return null;
	}

	public static JSONObject getJsonObject(String filePath, int item) {
		try {
			String string = readFile(filePath);
			JSONArray array = new JSONArray(string);

			return array.getJSONObject(item - 1);
		} catch (JSONException e) {
			LOG.error("There was an error: " + e.getMessage());
		}
		return null;
	}

	private static String readFile(String path) {
		byte[] encoded = null;
		try {
			encoded = Files.readAllBytes(Paths.get(path));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			LOG.error("There was an error: " + e.getMessage());
		}
		return new String(encoded, StandardCharsets.UTF_8);
	}

	@SuppressWarnings("unchecked")
	public static String jsonToSql(JSONObject json) {
		StringBuilder builder = new StringBuilder();
		builder.append("insert into ");
		JSONObject fields = null;
		try {
			builder.append((String) json.get("nimi"));
			fields = (JSONObject) json.get("sisalto");
		} catch (JSONException e) {
			LOG.error("There was an error: " + e.getMessage());
		}

		builder.append(" (");
		Iterator<String> keys = fields.keys();
		builder.append(StringUtils.join(keys, ", "));
		builder.append(") values (");

		List<Object> sqlValues = new ArrayList<Object>();

		keys = fields.keys();
		while (keys.hasNext()) {
			Object object = null;
			try {
				object = fields.get(keys.next());
			} catch (JSONException e) {
				LOG.error("There was an error: " + e.getMessage());
			}
			if (isNumber(object))
				sqlValues.add(object);
			else if (isDate(object))
				sqlValues.add(object);
			else
				sqlValues.add("'" + object + "'");
		}
		builder.append(StringUtils.join(sqlValues, ", "));
		builder.append(")");

		return builder.toString();
	}

	public static JSONArray createEntriesInJson(Catalogue catalogue, int count) throws JSONException {
		switch (catalogue) {
		case JARJESTELMA:
			return createEntries(1, count, "TIETOJARJESTELMASALKKU", "TIETOJARJESTELMATUNNUS", "JARJESTELMAN_NIMI", 1);
		case PALVELU:
			return createEntries(1, count, "PALVELU", "PALVELUTUNNUS", "NIMI", 1);
		case LOOGINEN:
			return createEntries(1, count, "LOOGINENTIETOVARANTO", "LOOGINENTIETOVARANTOTUNNUS", "NIMI", 1);
		case FYYSINEN:
			return createEntries(1, count, "FYYSINENTIETOVARANTO", "FYYSINENTIETOVARANTOTUNNUS", "NIMI", 1);
		case PAATIETORYHMA:
			return createEntries(1, count, "PAATIETORYHMA", "PAATIETORYHMATUNNUS", "NIMI", 1);
		case TIETORYHMA:
			return createTietoryhmaEntries(1, count);
		case TIETOLAJI:
			return createTietolajiEntries(1, count);
		default:
			return null;
		}

	}

	public static JSONArray createTietoryhmaEntries(int startId, int count) {
		ArrayList<String> names = createRandomNameList(count);

		JSONArray entries = new JSONArray();
		for (long i = 0; i < count; i++) {
			JSONObject entry = new JSONObject();
			try {
				entry.put("nimi", "TIETORYHMA");
				JSONObject content = new JSONObject();
				content.put("TIETORYHMATUNNUS", i + startId);
				content.put("NIMI", names.get((int) i));
				content.put("PAATIETORYHMATUNNUS", 1);
				content.put("KOODI", names.get((int) i));
				content.put("KUVAUS", names.get((int) i));
				entry.put("sisalto", content);
				entries.put(entry);
			} catch (JSONException e) {
				LOG.error("There was an error: " + e.getMessage());
			}
		}
		return entries;
	}

	public static JSONArray createTietolajiEntries(int startId, int count) {
		ArrayList<String> names = createRandomNameList(count);

		JSONArray entries = new JSONArray();
		for (long i = 0; i < count; i++) {
			JSONObject entry = new JSONObject();
			try {
				entry.put("nimi", "TIETO");
				JSONObject content = new JSONObject();
				content.put("TIETOTUNNUS", i + startId);
				content.put("NIMI", names.get((int) i));
				content.put("LOOGINENTIETOVARANTOTUNNUS", 1);
				content.put("TIETORYHMATUNNUS", 1);
				entry.put("sisalto", content);
				entries.put(entry);
			} catch (JSONException e) {
				LOG.error("There was an error: " + e.getMessage());
			}
		}
		return entries;
	}

	public static JSONObject createEntry(String tableName, Map<String, Object> contentMap) {
		JSONObject entry = new JSONObject();
		try {
			entry.put("nimi", tableName);
			JSONObject content = new JSONObject();
			for (String contentKey : contentMap.keySet()) {
				content.put(contentKey, contentMap.get(contentKey));
			}
			entry.put("sisalto", content);
		} catch (JSONException e) {
			LOG.error("There was an error: " + e.getMessage());
		}

		return entry;
	}

	public static JSONArray createEntryWithJoin(String tableName, Map<String, Object> contentMap) {
		JSONArray jsonArray = new JSONArray();
		JSONObject entry = createEntry(tableName, contentMap);
		jsonArray.put(entry);

		if (tableName.equals("TIETORYHMA")) {
			JSONObject joinEntry = createEntry("TIETORYHMAPAATIETORYHMA",
					ImmutableMap.of(
							"TIETORYHMATUNNUS", contentMap.get("TIETORYHMATUNNUS"),
							"PAATIETORYHMATUNNUS", contentMap.get("PAATIETORYHMATUNNUS"),
							"RIVITILA", "A",
							"RIVITUNNUS", TestDbUtil.getNextSequenceVal("jointietorpaatietor_id_seq")));
			jsonArray.put(joinEntry);
		} else if (tableName.equals("TIETO")) {
			JSONObject joinEntry1 = createEntry("TIETOTIETORYHMA",
					ImmutableMap.of(
							"TIETOTUNNUS", contentMap.get("TIETOTUNNUS"),
							"TIETORYHMATUNNUS", contentMap.get("TIETORYHMATUNNUS"),
							"RIVITILA", "A",
							"RIVITUNNUS", TestDbUtil.getNextSequenceVal("jointietolajitietoryhma_id_seq")));

			JSONObject joinEntry2 = createEntry("TIETOLOOGINENTIETOVARANTO",
					ImmutableMap.of(
							"TIETOTUNNUS", contentMap.get("TIETOTUNNUS"),
							"LOOGINENTIETOVARANTOTUNNUS", contentMap.get("LOOGINENTIETOVARANTOTUNNUS"),
							"RIVITILA", "A",
							"RIVITUNNUS", TestDbUtil.getNextSequenceVal("jointietolajilooginen_id_seq")));
			jsonArray.put(joinEntry1);
			jsonArray.put(joinEntry2);
		}

		return jsonArray;
	}


	public static JSONArray createEntries(int startId, int count, String name, String idFieldName,
			String nameFieldName, int active) {
		ArrayList<String> names = createRandomNameList(count);

		JSONArray entries = new JSONArray();
		for (long i = 0; i < count; i++) {
			JSONObject entry = new JSONObject();
			try {
				entry.put("nimi", name);
				JSONObject content = new JSONObject();
				content.put(idFieldName, i + startId);
				content.put(nameFieldName, names.get((int) i));
				entry.put("sisalto", content);
				entries.put(entry);
			} catch (JSONException e) {
				LOG.error("There was an error: " + e.getMessage());
			}
		}
		return entries;
	}

	public static JSONArray createKasiteEntriesInJson(Catalogue catalogue) {
		switch (catalogue) {

		default:
			return null;
		}
	}

	private static JSONArray createKasiteEntries(String name, String id_name) {
		JSONArray entries = new JSONArray();
		int id = 0;
		for (int i = 1; i <= 5; i++) {
			try {
				for (int j = 1; j <= i; j++) {
					JSONObject entry = new JSONObject();
					entry.put("nimi", name);
					JSONObject content = new JSONObject();
					content.put(id_name, id++);
					content.put("kasite", "kasite" + i);
					content.put("arvo", "arvo" + i + "_" + j);
					entry.put("sisalto", content);
					entries.put(entry);
				}
			} catch (JSONException e) {
				LOG.error("There was an error: " + e.getMessage());
			}
		}
		return entries;
	}

	public static ArrayList<String> createRandomNameList(int count) {
		// Random order for names
		ArrayList<String> names = new ArrayList<String>();
		for (int i = 1; i <= count; i++)
			names.add("a" + (i < 10 ? "0" + i : i));
		Collections.shuffle(names);
		return names;
	}

	private static boolean isDate(Object object) {
		return object.toString().contains("to_date('");
	}

	private static boolean isNumber(Object value) {
		return value instanceof Number;
	}

	public static JSONArray createActiveEntriesInJson(Catalogue catalogue, int startId, int count) {
		switch (catalogue) {

		default:
			return null;
		}
	}

	public static JSONArray createInactiveEntriesInJson(Catalogue catalogue, int startId, int count)
			throws JSONException {
		switch (catalogue) {

		default:
			return null;
		}
	}

	public static ContentDto createEntry(Catalogue catalogue) {
		ContentDto newEntry = null;
		switch (catalogue) {

		default:
			break;
		}
		newEntry.setNimi("New content");
		return newEntry;
	}

	public static MainController getRest(Catalogue catalogue) {
		switch (catalogue) {

		default:
			return null;
		}
	}
}
