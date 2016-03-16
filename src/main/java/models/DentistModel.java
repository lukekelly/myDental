/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package models;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import lib.AeSimpleSHA1;

import com.datastax.driver.core.BoundStatement;
import com.datastax.driver.core.Cluster;
import com.datastax.driver.core.PreparedStatement;
import com.datastax.driver.core.ResultSet;
import com.datastax.driver.core.Row;
import com.datastax.driver.core.Session;
import java.security.Timestamp;
import java.util.Date;
import java.util.LinkedList;


import java.util.Set;
import stores.Dentist;


/**
 *
 * @author Administrator
 */
public class DentistModel {
    Cluster cluster;
    
    public DentistModel(){
        
    }
    
    public void setCluster(Cluster cluster) {
        this.cluster = cluster;
    }
    
 public boolean RegisterDentist(String username, String Password, String name, String surname){
        AeSimpleSHA1 sha1handler=  new AeSimpleSHA1();
        String EncodedPassword=null;
        try 
        {
            EncodedPassword= sha1handler.SHA1(Password);
        }
        catch (UnsupportedEncodingException | NoSuchAlgorithmException et)
        {
            System.out.println("Can't check your password");
            return false;
        }
        Session session = cluster.connect("myDental");        
        PreparedStatement ps = session.prepare("insert into dentists (username, firstname, lastname, password, dateAdded) Values(?,?,?,?,?)");
       
        BoundStatement boundStatement = new BoundStatement(ps);
        Date dateAdded = new Date();
        session.execute(boundStatement.bind(username,name,surname,EncodedPassword, dateAdded));
       
        return true;
    }
 
 // public LinkedList<Dentist> getUserInfo(String username)
          public Dentist getUserInfo(String user){

    	//java.util.LinkedList<Dentist> userProfile =  null; //new java.util.LinkedList<>();
        
        Session session = cluster.connect("myDental");
        PreparedStatement ps = session.prepare("select username, firstname, lastname from dentists where login = ?");
        BoundStatement boundStatement = new BoundStatement(ps);
        ResultSet rs = null;
        rs = session.execute(boundStatement.bind(user));
        session.close();
        
        Dentist profile = null;
        
        if (rs.isExhausted()) {
            System.out.println("No profiles returned for user: " + user);
            return null;
        } else {
            for (Row row : rs) {
                profile = new Dentist();
                
                String username = row.getString("login");
                String firstName = row.getString("first_name");
                String lastName = row.getString("last_name");
              //  java.util.UUID profilePic = row.getUUID("profile_pic");
              //  Set<String> emails = row.getSet("email", String.class);
                
                profile.setUsername(username);
                profile.setFirstName(firstName);
                profile.setLastName(lastName);
   
            }
        }
        
        
        return profile;
    }
    
 
    public boolean IsValidDentist(String username, String Password){
        AeSimpleSHA1 sha1handler=  new AeSimpleSHA1();
        String EncodedPassword=null;
        try 
        {
            EncodedPassword= sha1handler.SHA1(Password);
        }
        catch (UnsupportedEncodingException | NoSuchAlgorithmException et)
        {
            System.out.println("Can't check your password");
            return false;
        }
        Session session = cluster.connect("myDental");
        PreparedStatement ps = session.prepare("select password from dentists where username =?");
        System.out.println("The Dentist is: " + username);
        System.out.println("This is your encoded password: " + EncodedPassword);
        ResultSet rs = null;
        BoundStatement boundStatement = new BoundStatement(ps);
        rs = session.execute(boundStatement.bind(username));
        if (rs.isExhausted()) 
        {
            System.out.println("No Dentist found!");
            return false;
        } 
        else 
        {
            for (Row row : rs) 
            {   
                String StoredPass = row.getString("password");
                if (StoredPass.compareTo(EncodedPassword) == 0)
                return true;
            }
        }
    return false;  
    }

       
    public boolean existingDentist(String username)
    {
    	Session session = cluster.connect("myDental");
    	PreparedStatement ps = session.prepare("select username from dentists where username=?");
    	ResultSet rs = null;
    	BoundStatement boundStatement = new BoundStatement(ps);
        rs = session.execute(boundStatement.bind(username));
        if (rs.isExhausted()) 
        {
            System.out.println("No user found: " + username);
            return false;
        } else 
        {
        	System.out.println("Dentist " + username + " already exists!");
        	return true;
        }
    }

        
      public Dentist getDentistInfo(String user) {
      
       Session session = cluster.connect("myDental");
       
       ResultSet rs;
       PreparedStatement ps = session.prepare("select username, firstname, lastname, dateadded from dentists where username = ?");
       rs = null;
       BoundStatement boundStatement = new BoundStatement(ps);
       rs = session.execute(boundStatement.bind(user));
        Dentist dentist = null;
       if (rs.isExhausted()) {
            System.out.println("No user found");
            return null;
        } else {
            for (Row row : rs) {
                dentist = new Dentist();
                String username = row.getString("username");
                String firstName = row.getString ("firstname");
                String lastName = row.getString ("lastname");
                Date date = row.getDate("dateadded");                
                dentist.setUsername(username);
                dentist.setFirstName(firstName);
                dentist.setLastName(lastName);
                dentist.setDate(date);
                System.out.println("Dentist info" + username + firstName + lastName + date);
            }
        }
        return dentist;
    }      
   
/*public boolean editProfile(String username, String firstname, String lastname, String bio)
{
    Session session = cluster.connect("myDental");
    PreparedStatement ps = session.prepare("UPDATE patients SET firstname = ?, lastname = ? WHERE username = ?");
    BoundStatement bs = new BoundStatement(ps);
    session.execute(bs.bind(firstname, lastname, username));
    return true;
}*/
}