package fi.liike.testutils;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "TEST_TABLE_TEMP")
public class TestObjTemp implements Serializable, Cloneable {
    @Id
    @Column(name = "ID", unique = true, nullable = false)
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "seq_gen")
    @SequenceGenerator(name = "seq_gen", sequenceName = "seq_TEST_TABLE_TEMP")
    private Integer id;

    @Column(name = "OBJECT_ID")
    private String objectID;

    @Column(name = "NAME")
    private String name;

    @Column(name = "POISTUNUT")
    private Integer inactive;


    public Integer getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getInactive() {
        return inactive;
    }

    public String getObjectID() {
        return objectID;
    }

    public void setObjectID(String objectID) {
        this.objectID = objectID;
    }

    @Override
    public String toString() {
        return "TestObjTemp{" +
                "id=" + id +
                ", objectID='" + objectID + '\'' +
                ", name='" + name + '\'' +
                ", inactive=" + inactive +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        TestObjTemp testObj = (TestObjTemp) o;

        if (id != null ? !id.equals(testObj.id) : testObj.id != null) return false;
        if (objectID != null ? !objectID.equals(testObj.objectID) : testObj.objectID != null) return false;
        if (name != null ? !name.equals(testObj.name) : testObj.name != null) return false;
        return inactive != null ? inactive.equals(testObj.inactive) : testObj.inactive == null;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (objectID != null ? objectID.hashCode() : 0);
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (inactive != null ? inactive.hashCode() : 0);
        return result;
    }
}
