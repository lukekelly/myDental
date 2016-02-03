/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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

            
            Session session = c.connect();
            try {
                PreparedStatement statement = session
                        .prepare(createKeyspace);
                BoundStatement boundStatement = new BoundStatement(
                        statement);
                ResultSet rs = session
                        .execute(boundStatement);
                System.out.println("created STS");
            } catch (Exception et) {
                System.out.println("Can't create STS " + et);
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
            
            session.close();

        } catch (Exception et) {
            System.out.println("Other keyspace or coulmn definition error" + et);
        }

    }
}
