package fi.liike.rest.auth;

import java.util.ArrayList;
import java.util.List;

public enum UserGroup {
    ADMIN(Right.getAllRights()),
    SUPER_USER(Right.getModifyAllRights());

    private List<Right> rights;

    UserGroup(List<Right> rights) {
        this.rights = rights;
    }

    public List<Right> getRights() {
        return rights;
    }

    public Boolean hasRights(List<Right> rights) {
        return this.rights.containsAll(rights);
    }

    private static UserGroup getUserGroup(String oamGroup) {
        if (oamGroup.equals("tk_tietoturva")) {
            return SUPER_USER;
        } else {
            return null;
        }
    }

    public static List<UserGroup> getUserGroups(String[] oamGroups) {
        List<UserGroup> userGroups = new ArrayList<UserGroup>();
        for (String oamGroup : oamGroups) {
            if (oamGroup != null) {
                UserGroup userGroup = getUserGroup(oamGroup);
                if (userGroup != null) userGroups.add(getUserGroup(oamGroup));
            }
        }
        return userGroups;
    }
}
