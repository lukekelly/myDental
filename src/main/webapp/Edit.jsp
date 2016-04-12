<%-- 
    Document   : Edit
    Created on : 25-Mar-2016, 14:06:54
    Author     : Luke
--%>

<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import= "stores.*" %>
<%@ page import= "models.*" %>
<%@ page import="lib.CassandraHosts"%>
<%@ page import="com.datastax.driver.core.Cluster"%>
<%@ page import="java.util.LinkedList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Edit Stories</title>
        <link rel="icon" type="image/png" href="MyDental.png"/>
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <link href="Styles.css" type="text/css" rel="stylesheet"> 
    </head>
    <body class="body">
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span> 
                    </button>
                    <a class="navbar-brand" href="/myDental">myDental</a>      
                </div>
                 <ul class="nav navbar-nav">
                        <li><a href="dentistPortal.jsp">Dental Portal Home</a></li>
                    </ul>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="/myDental/logout">Logout</a></li>
                    </ul>
                </div>
            </div>

            <%  LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");%>
            <%
                Cluster cluster = null;
                cluster = CassandraHosts.getCluster();

                PicModel picMod = new PicModel();
                picMod.setCluster(cluster);


            %>
        </nav> 
        
        <div class="container">
            <div class="row">
                <%                    if (lg != null) {
                        if (lg.getloggedin()) {

                %>
                <div class="col-lg-12">
                    <h1 class="page-header">Edit <%=lg.getFirstName()%>'s stories</h1>
                </div>
                <%
                } else {%>
                <%}}%>
                
            </div>
        </div>
                <div class="container">                                                                                    
  <div class="table-responsive table-striped">          
  <table class="table">
    <thead>
      <tr>
           <strong><th>Story</th></strong>
        <th>Image</th>
        <th>Caption</th>
      </tr>
    </thead>
    <tbody>
      <tr>
          <td><input type="text" class="form-control" placeholder="Check Up"></td>
          <td> <input type="file"></td>
        <td><input type="text" class="form-control" placeholder="Sign in at the reception"></td>
      </tr>
    </tbody>
  </table>
  </div>
</div>
        
        
        
        
        
</body>
</html>

