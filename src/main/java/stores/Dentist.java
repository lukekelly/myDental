/**
 * Author   : Luke Kelly
 */
package stores;

import static com.datastax.driver.core.DataType.timestamp;
import static com.sun.org.apache.xalan.internal.lib.ExsltDatetime.date;
import java.security.Timestamp;
import java.util.Date;
import java.util.Set;


public class Dentist {
    String username = null;
    String firstName = null;
    String lastName = null;
    Date date = null;

    public Date getDate() {
        return date;
    }

    public Date setDate(Date date) {
        this.date = date;
        return null;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }
}
