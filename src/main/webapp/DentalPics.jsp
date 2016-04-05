<%-- 
    Document   : DentalPics
    Created on : 21-Feb-2016, 18:10:12
    Author     : Luke
--%>

<%@page import= "java.util.*"%>
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
        <title>Dentist Library</title>
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

            <%  LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
                Cluster cluster = null;
                cluster = CassandraHosts.getCluster();

                PicModel picMod = new PicModel();
                picMod.setCluster(cluster); %>
        </nav>


        <div class="container">

            <%                    if (lg != null) {
                    if (lg.getloggedin()) {

            %>
            <div class="col-lg-12">
                <h1 class="page-header"><%=lg.getFirstName()%>'s Picture Library</h1>
            </div>
            <%
                } else {%>
            <h1>Your uploaded Images</h1>
            <%}%>
            <%
                java.util.LinkedList<Pic> lsPics = (java.util.LinkedList<Pic>) request.getAttribute("Pics");
                int lsFlags = 0;
                if (lsPics == null) {
            %>
            <p><strong>Your Library is empty!</strong></p>
            <p><strong><a href="picUpload.jsp">Click here to upload an image now</a></strong></p>
        </div>
        <%
        } else {
            Iterator<Pic> iterator;
            iterator = lsPics.iterator();
            while (iterator.hasNext()) {
                Pic p = (Pic) iterator.next();
        %>

        <div class="row">
            <div class="span1"><img src="/myDental/Thumb/<%=p.getSUUID()%>" width="200" height="200"></div>
        </div>	



        <%

                    }
                }
            }
        %>


</body>
</html>
