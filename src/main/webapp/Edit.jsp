<%-- 
    Document   : Edit
    Created on : 25-Mar-2016, 14:06:54
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
                    <li><a href="dentistPortal.jsp">Dashboard<span class="glyphicon glyphicon-dashboard"></span></a></li>
                </ul>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="/myDental/logout">Logout <span class="glyphicon glyphicon-log-out"></span></a></li>
                    </ul>
                </div>
            </div>

            <%  LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
                Cluster cluster = null;
                cluster = CassandraHosts.getCluster();

                PicModel picMod = new PicModel();
                picMod.setCluster(cluster); %>
        </nav> 

        <%                    if (lg != null) {
                if (lg.getloggedin()) {

        %>
        <div class="container">
        <div class="col-lg-12">
            <h1 class="page-header"><%=lg.getFirstName()%>'s Stories</h1>
        </div>
        <div class="panel panel-default">
            <!-- Default panel contents -->
            <div class="panel-heading">Below are the stories you have published. To edit a story, simply select the title.. </div>
            <!-- List group -->
            <ul class="list-group">
                <li class="list-group-item"><a> <span class="glyphicon glyphicon-edit"></span>  Check Up</a></li>
                <li class="list-group-item"><a href="/myDental/Edit"><span class="glyphicon glyphicon-edit"></span>  Hygienist Visit</a></li>
                <li class="list-group-item"><a><span class="glyphicon glyphicon-edit"></span>  White Filling</a></li>
                <li class="list-group-item"><a><span class="glyphicon glyphicon-edit"></span>  Fissure Sealant</a></li>
                <li class="list-group-item"><a><span class="glyphicon glyphicon-edit"></span>  Local Anaesthetic</a></li>
                <li class="list-group-item"><a><span class="glyphicon glyphicon-edit"></span>  X ray</a></li>
                <li class="list-group-item"><a><span class="glyphicon glyphicon-edit"></span> NEWEST STORY</a></li>
            </ul>
        </div>
        </div>
        <%
                }
            }
        %>
   
    </body>
</html>


