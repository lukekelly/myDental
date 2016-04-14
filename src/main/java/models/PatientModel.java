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


import java.util.Set;
import stores.Patient;


/**
 *
 * @author Administrator
 */
public class PatientModel {
    Cluster cluster;
    
    public PatientModel(){
        
    }
    
    public void setCluster(Cluster cluster) {
        this.cluster = cluster;
    }
    
 public boolean RegisterPatient(String username, String Password, String name, String surname){
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
        PreparedStatement ps = session.prepare("insert into patients (username, firstname, lastname, password, dateAdded) Values(?,?,?,?,?)");
       
        BoundStatement boundStatement = new BoundStatement(ps);
        Date dateAdded = new Date();
        session.execute(boundStatement.bind(username,name,surname,EncodedPassword, dateAdded));
       
        return true;
    }
    
    public boolean IsValidPatient(String username, String Password){
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
        PreparedStatement ps = session.prepare("select password from patients where username=?");
        System.out.println("The Patient is: " + username);
        System.out.println("This is your encoded password: " + EncodedPassword);
        ResultSet rs = null;
        BoundStatement boundStatement = new BoundStatement(ps);
        rs = session.execute(boundStatement.bind(username));
        if (rs.isExhausted()) 
        {
            System.out.println("No Patient found!");
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

       
    public boolean existingPatient(String username)
    {
    	Session session = cluster.connect("myDental");
    	PreparedStatement ps = session.prepare("select username from patients where username=?");
    	ResultSet rs = null;
    	BoundStatement boundStatement = new BoundStatement(ps);
        rs = session.execute(boundStatement.bind(username));
        if (rs.isExhausted()) 
        {
            System.out.println("No user found: " + username);
            return false;
        } else 
        {
        	System.out.println("Patient " + username + " already exists!");
        	return true;
        }
    }

        
      public Patient getPatientInfo(String user) {
      
       Session session = cluster.connect("myDental");
       
       ResultSet rs;
       PreparedStatement ps = session.prepare("select username, firstname, lastname, dateadded from patients where username = ?");
       rs = null;
       BoundStatement boundStatement = new BoundStatement(ps);
       rs = session.execute(boundStatement.bind(user));
        Patient patient = null;
       if (rs.isExhausted()) {
            System.out.println("No user found");
            return null;
        } else {
            for (Row row : rs) {
                patient = new Patient();
                String username = row.getString("username");
                String firstName = row.getString ("firstname");
                String secondName = row.getString ("lastname");
                Date date = row.getDate("dateadded");                
                patient.setUsername(username);
                patient.setFirstName(firstName);
                patient.setSecondName(secondName);
                patient.setDate(date);
                System.out.println("Patient info" + username + firstName + secondName + date);
            }
        }
        return patient;
    }      
   
    public String getFirstName(String username){
    	   String firstName = "no name found";
    	   Session session = cluster.connect("myDental");
           PreparedStatement ps = session.prepare("select firstname from patients where username = ?");
           ResultSet rs = null;
           BoundStatement boundStatement = new BoundStatement(ps);
           rs = session.execute(boundStatement.bind(username));                         
           if (rs.isExhausted()) {
               System.out.println("No name found");
               return "";
           } else {
               for (Row row : rs) {                  
                   firstName = row.getString("firstname");               
                   }
           }   
       return firstName ;  
       }  
    
        public String getSecondName(String username){
    	   String secondName = "no name found";
    	   Session session = cluster.connect("myDental");
           PreparedStatement ps = session.prepare("select lastname from patients where username = ?");
           ResultSet rs = null;
           BoundStatement boundStatement = new BoundStatement(ps);
           rs = session.execute(boundStatement.bind(username));                         
           if (rs.isExhausted()) {
               System.out.println("No name found");
               return "";
           } else {
               for (Row row : rs) {                  
                   secondName = row.getString("lastname");               
                   }
           }   
       return secondName ;  
       }
      
   public void UpdateUserDetails(String username, String firstName, String secondName){
       
        Session session = cluster.connect("myDental");    
        PreparedStatement ps = session.prepare("update patients set firstname=?, lastname=? where username=? ");
        BoundStatement boundStatement = new BoundStatement(ps);
        
        session.execute(boundStatement.bind(firstName, secondName, username ));  
        
    }
}