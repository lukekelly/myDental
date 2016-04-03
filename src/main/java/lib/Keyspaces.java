package lib;

import com.datastax.driver.core.BoundStatement;
import com.datastax.driver.core.Cluster;
import com.datastax.driver.core.PreparedStatement;
import com.datastax.driver.core.ResultSet;
import com.datastax.driver.core.Session;
import com.datastax.driver.core.SimpleStatement;

/**
 *
 * @author Luke Kelly
 */
public final class Keyspaces {
    
    public Keyspaces() {

    }

public static void SetUpKeySpaces(Cluster c) {
        try {
            String createKeyspace ="CREATE KEYSPACE IF NOT EXISTS mydental WITH replication = {'class':'SimpleStrategy', 'replication_factor':1}";

            String createPatientsTable = "CREATE TABLE IF NOT EXISTS mydental.patients("
                    + " Username text PRIMARY KEY,"
                    + " Password varchar,"
                    + " FirstName text,"
                    + " LastName text,"
                    + " DateAdded timestamp"
                    + ")";
            
            String createDentistsTable = "CREATE TABLE IF NOT EXISTS mydental.dentists("
                    + " Username text PRIMARY KEY,"
                    + " Password varchar,"
                    + " FirstName text,"
                    + " LastName text,"
                    + " DateAdded timestamp"
                    + ")";
            
            String createPicTable = "CREATE TABLE if not exists mydental.Pics ("
                    + " user varchar,"
                    + " picid uuid, "
                    + " interaction_time timestamp,"
                    + " title varchar,"
                    + " image blob,"
                    + " thumb blob,"
                    + " processed blob,"
                    + " imagelength int,"
                    + " thumblength int,"
                    + "  processedlength int,"
                    + " type  varchar,"
                    + " name  varchar,"
                    + " PRIMARY KEY (picid)"
                    + ")";
            
            String createUserPicListTable = "CREATE TABLE if not exists mydental.userpiclist (\n"
                    + "picid uuid,\n"
                    + "user varchar,\n"
                    + "caption varchar,\n"
                    + "pic_added timestamp,\n"
                    + "PRIMARY KEY (user,pic_added)\n"
                    + ") WITH CLUSTERING ORDER BY (pic_added desc);";
            
            String CreateComments = "CREATE TABLE if not exists mydental.comments (\n"
                    + "	comment_id uuid PRIMARY KEY,\n"
                    + "	pic_id uuid,\n"
                    + "	date_created timestamp,\n"
                    + "	user text,\n"
                    + "	content text\n"
                    + ");";
            String CreateComments2ndIndex = " CREATE INDEX if not exists ON mydental.comments (pic_id);";
            
            String CreateFlags = "CREATE TABLE if not exists mydental.flags (\n"            		
            		+ " flags int,\n"
            		+ " login text,\n"
            		+ " picid text,\n"
            		+ " PRIMARY KEY (picid, login)\n"
            		+ "  );";
            
            String CreateResults = "CREATE TABLE if not exists mydental.results (\n"            		
            		+ " result text,\n"
            		+ " login text,\n"
            		+ " PRIMARY KEY (result)\n"
            		+ "  );";
            
            
            Session session = c.connect();
            try {
                PreparedStatement statement = session
                        .prepare(createKeyspace);
                BoundStatement boundStatement = new BoundStatement(
                        statement);
                ResultSet rs = session
                        .execute(boundStatement);
                System.out.println("created myDental");
            } catch (Exception et) {
                System.out.println("Can't create myDental" + et);
            }

            System.out.println("" + createPatientsTable);
            try {
                SimpleStatement cqlQuery = new SimpleStatement(createPatientsTable);
                session.execute(cqlQuery);
            } catch (Exception et) {
                System.out.println("Can't create PATIENTS table " + et);
            }
             System.out.println("" + createDentistsTable);
            try {
                SimpleStatement cqlQuery = new SimpleStatement(createDentistsTable);
                session.execute(cqlQuery);
            } catch (Exception et) {
                System.out.println("Can't create DENTISTS table " + et);
            }
             System.out.println("" + createPicTable);
            try {
                SimpleStatement cqlQuery = new SimpleStatement(createPicTable);
                session.execute(cqlQuery);
            } catch (Exception et) {
                System.out.println("Can't create PICS table " + et);
            }
             System.out.println("" + createUserPicListTable);
            try {
                SimpleStatement cqlQuery = new SimpleStatement(createUserPicListTable);
                session.execute(cqlQuery);
            } catch (Exception et) {
                System.out.println("Can't create USERPICLIST table " + et);
            }
                System.out.println("" + CreateComments);
             try {
                SimpleStatement cqlQuery = new SimpleStatement(CreateComments);
                session.execute(cqlQuery);
            } catch (Exception et) {
                System.out.println("Can't create comments " + et);
            }
            System.out.println("" + CreateComments);
            
            try {
                SimpleStatement cqlQuery = new SimpleStatement(CreateComments2ndIndex);
                session.execute(cqlQuery);
            } catch (Exception et) {
                System.out.println("Can't create comments index " + et);
            }
            System.out.println("" + CreateComments2ndIndex);
            
             System.out.println("" + CreateFlags);
            try {
                SimpleStatement cqlQuery = new SimpleStatement(CreateFlags);
                session.execute(cqlQuery);
            } catch (Exception et) {
                System.out.println("Can't create Flags table " + et);
            }
            
             System.out.println("" + CreateResults);
            try {
                SimpleStatement cqlQuery = new SimpleStatement(CreateResults);
                session.execute(cqlQuery);
            } catch (Exception et) {
                System.out.println("Can't create Results table " + et);
            }
            
            
            session.close();

        } catch (Exception et) {
            System.out.println("Other keyspace or coulmn definition error" + et);
        }

    }
}
