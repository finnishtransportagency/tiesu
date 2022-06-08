package fi.liike.rest.Controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.*;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;


//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;

import fi.liike.rest.Service.TiesuunnitelmaService;
import fi.liike.rest.api.ContentDto;
import fi.liike.rest.api.SearchContent;
import fi.liike.rest.api.dto.TiesuunnitelmaDto;

@Path("/tiesuunnitelma/")
public class TiesuunnitelmaController extends MainController {

	//private final Logger LOG = LoggerFactory.getLogger(TiesuunnitelmaController.class);
	private TiesuunnitelmaService service;

	public TiesuunnitelmaController() {
		service = new TiesuunnitelmaService();
	}

	@POST
	@Path("")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Response create(@Context HttpServletRequest httpRequest, TiesuunnitelmaDto content) throws IOException {
		validate(content);
		return create(service, content, httpRequest);
	}

	// For abstract testing purpose only
	@Override
	public Response create(HttpServletRequest httpRequest, ContentDto content) throws IOException {
		return create(httpRequest, (TiesuunnitelmaDto) content);
	}

	@PUT
	@Path("")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Response update(@Context HttpServletRequest httpRequest, TiesuunnitelmaDto content) throws IOException {
		validate(content);
		setRemoteUserToContent(httpRequest, content);
		return buildResponse(service.update(content));
	}

	// For abstract testing purpose only
	@Override
	public Response update(HttpServletRequest httpRequest, ContentDto content) throws IOException {
		return update(httpRequest, (TiesuunnitelmaDto) content);
	}

	@GET
	@Path("")
	@Produces(MediaType.APPLICATION_JSON)
	public Response getAll(@DefaultValue("100") @QueryParam("size") String size,
			@DefaultValue("0") @QueryParam("offset") String offset, @DefaultValue("") @QueryParam("filter") String filter,
			@DefaultValue("") @QueryParam("sort") String sort) {
		SearchContent searchContent = new SearchContent(filter, sort);

		return super.getAll(service, searchContent, size, offset);
	}

	@Override
	@GET
	@Path("{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response get(@PathParam("id") String id) {
		return super.get(service, id);
	}

	@Override
	@DELETE
	@Path("{id}")
	public Response delete(@Context HttpServletRequest httpRequest, @PathParam("id") String id) {
		return super.delete(service, id, httpRequest);
	}

	@GET
	@Path("kasite")
	public Response getResources() {
		return super.getResources(service);
	}

	@Override
	public Response getKasite() {
		return getResources();
	}


}
