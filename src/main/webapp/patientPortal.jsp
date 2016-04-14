<%-- 
    Document   : patientPortal
    Created on : 20-Jan-2016, 16:40:09
    Author     : Luke
--%>
<%@page import= "java.util.Iterator"%>
<%@page import= "com.datastax.driver.core.Cluster"%>
<%@page import= "lib.CassandraHosts"%>
<%@page import= "models.PicModel"%>
<%@page import= "stores.Pic"%>
<%@page import= "stores.LoggedIn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Patient Portal</title>
        <link rel="icon" type="image/png" href="MyDental.png"/>
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <link href="Styles.css" type="text/css" rel="stylesheet"> 
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
 <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
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
                        <li><a href="PatientProfile.jsp"><span class="glyphicon glyphicon-user"></span>My Profile</a></li>
                    </ul>
                 <div class="collapse navbar-collapse" id="myNavbar">
                    
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="/myDental/logout">Logout</a></li>
                    </ul>
                </div>
            </div>
      
            <%  LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
                Cluster cluster = null;
                cluster = CassandraHosts.getCluster();

                PicModel picMod = new PicModel();
                picMod.setCluster(cluster);
            %>
        </nav> 

      
              <%                    if (lg != null) {
                    if (lg.getloggedin()) {

            %>
            <div class="container">

            <div class="row">

                <div class="col-lg-12">
                    <h1 class="page-header">Patient Portal: <%=lg.getFirstName()%></h1>
                </div>
   
                <div class="col-lg-4 col-md-4 col-xs-6 thumb">
                    <a class="thumbnail" href="/myDental/DisplayAllImages">
                        <img class="img-responsive" src="Pictures/NewStory.png" alt="">
                        <strong><p>Newest Story</p></strong>
                    </a>
                </div>
                  <div class="col-lg-4 col-md-4 col-xs-6 thumb">
                    <a class="thumbnail" href="checkup.jsp">
                        <img class="img-responsive" src="Pictures/7.PNG.jpg" alt="">
                        <strong><p>Check Up</p></strong>
                    </a>
                </div>
            </div>
            </div>
   
                    <% } else {%>
            <h1>Patient Portal: Not Logged In</h1>
            <%  }}  %>
        
</body>   
</html>