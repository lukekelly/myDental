<%-- 
    Document   : Image Upload
    Created on : 12-Feb-2016, 11:13:19
    Author     : Luke
--%>

<%@page import="stores.LoggedIn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Picture Upload</title>
        <link rel="icon" type="image/png" href="MyDental.png"/>
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <link href="Styles.css" type="text/css" rel="stylesheet">
    </head>
    <%

        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
        if (lg != null) {
            String username = lg.getUsername();
            if (lg.getloggedin()) {
    %>
    <body class="body">        
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span> 
                    </button>
                    <a class="navbar-brand" href="myDental">myDental</a>      
                </div>
                <ul class="nav navbar-nav">
                    <li><a href="dentistPortal.jsp">Dashboard<span class="glyphicon glyphicon-home"></span></a></li>
                </ul>
                <div class="collapse navbar-collapse" id="myNavbar">

                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="/myDental/logout">Logout</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container-fluid">
            <div class="col-lg-12">
                <h1 class="page-header">Image Upload</h1>
            </div>
            <div class="panel panel-default">
                <!-- Default panel contents -->
                <div class="panel-heading">This is where you can upload images from your device to your online image library.</div>
                <!-- List group -->
                <ul class="list-group">
                    <li>   <form method="POST" enctype="multipart/form-data" action="Image" class="center">
                            <input type="file" name="upfile" multiple="multiple">
                            <input type="text" name="caption" placeholder="Enter a caption here.." hidden><br/>
                            <input type="text" name="sendto" hidden="">
                            <button type="submit" class="btn btn-success" role="button">Upload Image <span class="glyphicon glyphicon-save"></span></button>
                        </form>
                    </li>

                </ul>
            </div>

        </div>
    <%}
    } else {

    %>
    <%        }%>
    </body>
</html>