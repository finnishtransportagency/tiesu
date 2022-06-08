package fi.liike.rest.auth;

import java.util.Arrays;
import java.util.List;

public enum Right {
    MODIFY_SECURED_FIELDS;

    public static List<Right> getAllRights() {
        return Arrays.asList(MODIFY_SECURED_FIELDS);
    }

    public static List<Right> getModifyAllRights() {
        return Arrays.asList(MODIFY_SECURED_FIELDS);
    }
}
