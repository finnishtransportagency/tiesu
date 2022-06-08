package fi.liike.rest.api;

import fi.liike.rest.auth.Right;

import java.util.List;
import java.util.Map;
import java.util.Set;

public abstract class ContentDto {

	protected static Map<Right, List<String>> mapRightToFields;

	public abstract void setNimi(String name);

	public abstract void setTunnus(Integer id);

	public abstract Integer getTunnus();

	public abstract String getNimi();

	public abstract void setRivimuokkaajatunnus(String header);

	public abstract String getRivimuokkaajatunnus();

	//For now these are used only with Jarjestelma
	public abstract List<Right> getNeededRights() throws NoSuchFieldException, IllegalAccessException;
	//Later on this could be abstract
	public List<String> getNoRightsToModify() {return null;}
	public void setNoRightsToModify(Set<Right> userRights) {}

	@Override
	public String toString() {
		return "ContentDto[tunnus=" + getTunnus() + ", nimi=" + getNimi() +"]";
	}
}
