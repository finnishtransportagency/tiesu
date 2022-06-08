package fi.liike.rest.Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import com.google.common.base.Preconditions;
import fi.liike.rest.auth.Right;
import fi.liike.rest.auth.UserGroup;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;
import static java.lang.String.format;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import fi.liike.rest.Service.Service;
import fi.liike.rest.api.ContentDto;
import fi.liike.rest.api.DtoResults;
import fi.liike.rest.api.KasiteArvoContent;
import fi.liike.rest.api.SearchContent;

public abstract class MainController {

	private final Logger LOG = LoggerFactory.getLogger(MainController.class);
	
	private final StringBuilder logBuilder = new StringBuilder();
	private final Gson jsonTool = new Gson();
		
	private void logRequest(String kutsuja, String... parametrit) {
		logBuilder.setLength(0);

		logBuilder.append("Pyyntö - ").append(kutsuja).append(" parametreilla: ");
		for (String s : parametrit) {
			logBuilder.append(s).append(", ");
		}
		logBuilder.setLength(logBuilder.length() - 1);
		LOG.info(logBuilder.toString());
	}

	protected Integer convertStringToInteger(String numberInString) {
		try {
			return Integer.valueOf(numberInString);
		} catch (NumberFormatException e) {
			LOG.error("Converting String to Integer failed. Error Message: " + e.getMessage());
			return null;
		}
	}

	protected Response buildResponse(List<ContentDto> content, int totalCount) {
		JSONObject jsonResponse = buildJSONObjectResponse(content, totalCount);
		if (jsonResponse == null) {
			return Response.serverError().build();
		}
		return Response.ok(jsonResponse, MediaType.APPLICATION_JSON).build();
	}

	private JSONObject buildJSONObjectResponse(List<ContentDto> content, int totalCount) {
		JSONObject dataToResponse = new JSONObject();
		JSONArray items = new JSONArray();
		Gson jsonTool = new GsonBuilder().serializeNulls().create();
		try {
			if (content.isEmpty()) {
				dataToResponse.put("items", items);
				dataToResponse.put("count", 0);
				return dataToResponse;
			}
			for (ContentDto data : content) {
				items.put(new JSONObject(jsonTool.toJson(data)));
				dataToResponse.put("items", items);
				dataToResponse.put("count", totalCount);
			}
			return dataToResponse;
		} catch (JSONException e) {
			LOG.error("Unable to create json object. Error Message:" + e.getMessage());
		}
		return null;
	}

	protected Response buildTietoarkkitehtuuriResponse(
			DtoResults fyysinen, DtoResults looginen, DtoResults tietolaji, DtoResults tietoryhma, DtoResults paatieto) {
		JSONObject dataToResponse = new JSONObject();
		JSONArray items = new JSONArray();
		Boolean allEmpty = false;
		try {
			if (allEmpty) {
				dataToResponse.put("items", items);
				dataToResponse.put("count", 0);
				return Response.ok(dataToResponse, MediaType.APPLICATION_JSON).build();
			}
			dataToResponse.put("fyysinen", buildJSONObjectResponse(fyysinen.getHaettavat(), fyysinen.getTotalCount()));
			dataToResponse.put("looginen", buildJSONObjectResponse(looginen.getHaettavat(), looginen.getTotalCount()));
			dataToResponse.put("tietolaji", buildJSONObjectResponse(tietolaji.getHaettavat(), tietolaji.getTotalCount()));
			dataToResponse.put("tietoryhma", buildJSONObjectResponse(tietoryhma.getHaettavat(), tietoryhma.getTotalCount()));
			dataToResponse.put("paatieto", buildJSONObjectResponse(paatieto.getHaettavat(), paatieto.getTotalCount()));

			return Response.ok(dataToResponse, MediaType.APPLICATION_JSON).build();
		} catch (JSONException e) {
			LOG.error("Unable to create json object. Error Message:" + e.getMessage());
		}
		return Response.serverError().build();
	}

	protected Response buildResponse(ContentDto content) {
		if (content == null)
			return Response.serverError().build();
		GsonBuilder jsonTool = new GsonBuilder();
		try {
			JSONObject response = new JSONObject(
					jsonTool.setDateFormat("dd.MM.yyyy hh:mm:ss.S").create().toJson(content));
			return Response.ok(response, MediaType.APPLICATION_JSON).build();
		} catch (JSONException e) {
			LOG.error("Unable to create json object. Error Message:" + e.getMessage());
			return Response.serverError().build();
		}
	}

	public Response create(Service service, ContentDto content, HttpServletRequest httpRequest) {
		try {
			setRemoteUserToContent(httpRequest, content);
			return buildResponse(service.save(content));
		} catch (IOException | SQLException  e) {
			LOG.error("Unable to set remote user content. Error Message:" + e.getMessage());
		}
		return Response.serverError().build();
	}

	public Response createAndFetchWithRights(Service service, ContentDto content, HttpServletRequest httpRequest) {
		try {
			setRemoteUserToContent(httpRequest, content);
			ContentDto createdContent = service.save(content);
			setUpNoRightsToModify(createdContent, httpRequest);
			return buildResponse(createdContent);
		} catch (IOException | SQLException  e) {
			LOG.error("Unable to set remote user content and fetch rights. Error Message:" + e.getMessage());
		}
		return Response.serverError().build();
	}

	public Response getAll(Service service, SearchContent searchContent, String size, String offset) {
		DtoResults results = getAllResults(service, searchContent, size, offset);
		if (results == null) {
			return Response.status(Response.Status.BAD_REQUEST).build();
		}
		return buildResponse(results.getHaettavat(), results.getTotalCount());
	}

	DtoResults getAllResults(Service service, SearchContent searchContent, String size, String offset) {
		Integer sizeInt = convertStringToInteger(size);
		Integer offsetInt = convertStringToInteger(offset);
		if (sizeInt == null || offsetInt == null) {
			return null;
		}

		searchContent.setSize(sizeInt);
		searchContent.setOffset(offsetInt);

		return service.getFiltered(searchContent);
	}

	public Response getAllMinimal(Service service, SearchContent searchContent, String size, String offset) {
		Integer sizeInt = convertStringToInteger(size);
		Integer offsetInt = convertStringToInteger(offset);
		if (sizeInt == null || offsetInt == null)
			return Response.status(Response.Status.BAD_REQUEST).build();

		searchContent.setSize(sizeInt);
		searchContent.setOffset(offsetInt);

		DtoResults results;
		results = service.getFiltered(searchContent);
		return buildResponse(results.getHaettavat(), results.getTotalCount());
	}

	public Response getFilteredForSahke(Service service, SearchContent searchContent, Integer size, Integer offset) {
		if (size == null || offset == null)
			return Response.status(Response.Status.BAD_REQUEST).build();

		searchContent.setSize(size);
		searchContent.setOffset(offset);

		DtoResults results;

		results = service.getFiltered(searchContent);

		return buildResponse(results.getHaettavat(), results.getTotalCount());
	}

	public Response get(Service service, String id) {
		int contentId = 0;
		try {
			contentId = Integer.valueOf(id);
		} catch (NumberFormatException e) {
			LOG.error("Unable to convert string to integer. Error Message:" + e.getMessage());
			return Response.status(Response.Status.BAD_REQUEST).build();
		}
		return buildResponse(service.get(contentId));
	}

	//This is same as get but with rights. Used only with Jarjestelma
	public Response getWithRights(Service service, String id, HttpServletRequest httpRequest) {
		int contentId = 0;
		try {
			contentId = Integer.valueOf(id);
		} catch (NumberFormatException e) {
			LOG.error("Unable to convert string to integer. Error Message:" + e.getMessage());
			return Response.status(Response.Status.BAD_REQUEST).build();
		}
		ContentDto content = service.get(contentId);
		setUpNoRightsToModify(content, httpRequest);
		return buildResponse(content);
	}

	//Used only with Jarjestelma
	void setUpNoRightsToModify(ContentDto content, HttpServletRequest httpRequest) {
		if (content == null) return;
		List<UserGroup> userGroupList = getUserGroups(httpRequest);
		Set<Right> userRights = new HashSet<Right>();
		if (userGroupList != null && userGroupList.size() > 0) {
			for (UserGroup userGroup : userGroupList) {
				userRights.addAll(userGroup.getRights());
			}
		}

		content.setNoRightsToModify(userRights);
	}

	protected Response delete(Service service, String id, HttpServletRequest httpRequest) {
		int contentId = 0;
		try {
			contentId = Integer.valueOf(id);
		} catch (NumberFormatException e) {
			LOG.error("Unable to convert string to integer. Error Message:" + e.getMessage());
			return Response.status(Response.Status.BAD_REQUEST).build();
		}
		if (service.delete(contentId, getUser(httpRequest)) == null)
			return Response.serverError().build();
		return Response.ok().build();
	}

	protected Response getResources(Service service) {
		return buildResponse(service.getResources());
	}

	protected void setRemoteUserToContent(HttpServletRequest httpRequest, ContentDto content) {
		logRequest("setRemoteUserToContent", httpRequest.getHeader("OAM_GROUPS"));
		content.setRivimuokkaajatunnus(httpRequest.getHeader("OAM_REMOTE_USER"));
	}

	protected String getUser(HttpServletRequest httpRequest) {
		return httpRequest.getHeader("OAM_REMOTE_USER");
	}

	public Response buildResponse(List<KasiteArvoContent> resources) {
		JSONObject resourcesToResponse = new JSONObject();
		JSONArray items = new JSONArray();
		Gson jsonTool = new Gson();
		try {
			if (resources.isEmpty()) {
				resourcesToResponse.put("resources", items);
				return Response.ok(resourcesToResponse, MediaType.APPLICATION_JSON).build();
			}
			for (KasiteArvoContent resource : resources) {
				items.put(new JSONObject(jsonTool.toJson(resource)));
				resourcesToResponse.put("resources", items);
			}
			return Response.ok(resourcesToResponse, MediaType.APPLICATION_JSON).build();
		} catch (JSONException e) {
			LOG.error("Unable to create json object. Error Message:" + e.getMessage());
		}
		return Response.serverError().build();
	}

	// For testing purpose only
	public abstract Response create(HttpServletRequest httpRequest, ContentDto content) throws IOException;

	// For testing purpose only
	public abstract Response get(String id);

	// For testing purpose only
	public abstract Response update(HttpServletRequest httpRequest, ContentDto newEntry) throws IOException;

	// For testing purpose only
	public abstract Response delete(HttpServletRequest httpRequest, String string);

	// For testing purpose only
	public abstract Response getKasite();

	protected void validate(ContentDto content) throws IOException {
		Preconditions.checkNotNull(content.getNimi(), "Nimi must not be null");
		if (content.getNimi().equals("")) {
			throw new RuntimeException();
		}
	}

	//For now this is used only from JarjestelmaController so keep this separated
	protected void validateWithRights(ContentDto content, HttpServletRequest httpRequest)
			throws NoSuchFieldException, IllegalAccessException, IOException {
		validate(content);

		List<UserGroup> userGroups = getUserGroups(httpRequest);
		List<Right> neededRights = content.getNeededRights();
		if (neededRights != null && neededRights.size() > 0 &&
				(userGroups == null || userGroups.size() == 0 || !userHasRights(userGroups, neededRights))) {
			LOG.info(format("validateWithRights:: User with username %s do not have the rights", getUser(httpRequest)));
			throw new IOException("User does not have the rights");
		}
	}

	private List<UserGroup> getUserGroups(HttpServletRequest httpRequest) {
		String oamGroupsHeader = httpRequest.getHeader("OAM_GROUPS");
		List<UserGroup> userGroups = null;
		if (oamGroupsHeader != null) {
			userGroups = UserGroup.getUserGroups(oamGroupsHeader.split(","));
		}
		return userGroups;
	}

	//We could expand this by cross-checking the rights divided between user groups
	private Boolean userHasRights(List<UserGroup> userGroups, List<Right> neededRights) {
		for (UserGroup userGroup : userGroups) {
			if (userGroup.hasRights(neededRights)) return true;
		}
		return false;
	}
}
