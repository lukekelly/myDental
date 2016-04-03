<%-- 
    Document   : searchResults
    Created on : 01-Apr-2016, 18:32:57
    Author     : Luke
--%>

<%@ page contentType="text/html; charset=ISO-8859-1"pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@ page import="stores.*" %>
<%@ page import="models.*" %>
<%@ page import="lib.CassandraHosts"%>
<%@ page import="com.datastax.driver.core.Cluster"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>
          	
     
     
     <%  LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
     
    	 
     
                Cluster cluster = null;
                cluster = CassandraHosts.getCluster();

                PicModel picMod = new PicModel();
                picMod.setCluster(cluster);
     
    
     String searchedFor = session.getAttribute("searchedFor").toString();
     out.println(session.getAttribute("searchedFor")); //print the passed searched text from UsersPics.jsp     
     %>
     

     
     <%     
     String picTag = picMod.returnSearchResults(searchedFor);
     %>
     
     <p><%=picTag%>" </p>> <br>
		
<% session.removeAttribute("searchedFor"); %>
</body>
</html>