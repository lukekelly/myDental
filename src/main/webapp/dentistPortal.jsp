<%-- 
    Document   : dentistPortal
    Created on : 01-Feb-2016, 16:54:41
    Author     : Luke
--%>

<%@page import="stores.LoggedIn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Dentist Portal</title>
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
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="/myDental/logout">Logout</a></li>
                    </ul>
                </div>
            </div>
        </nav>  
           <%
                        
                        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
                        if (lg != null) {
                            String username = lg.getUsername();
                            if (lg.getloggedin()) {
                    %>
    
        <ul class="nav navbar-nav navbar-left">
            <li><a href="/myDental/DentalRegister">Register a new Dental Practitioner</a></li> 
            <li><a href="/myDental/Register">Register a New Patient</a></li>   
            <li><a href="/myDental/Images">Picture Library</a></li> 
        </ul>
        
        
            <div class="container">

        <div class="row">

            <div class="col-lg-12">
                <h1 class="page-header">Dental Portal</h1>
            </div>

            <div class="col-lg-4 col-md-4 col-xs-6 thumb">
                <a class="thumbnail" href="createNewStory.jsp">
                    <img class="img-responsive" src="Pictures/NewStory.png" alt="">
                    <p>Create New Story</p>
                </a>
            </div>
            <div class="col-lg-4 col-md-4 col-xs-6 thumb">
                <a class="thumbnail" href="#">
                    <img class="img-responsive" src="Pictures/biyLEz9iL.png" alt="">
                    <p>View Stories</p>
                </a>
            </div>
            <div class="col-lg-4 col-md-4 col-xs-6 thumb">
                <a class="thumbnail" href="#">
                    <img class="img-responsive" src="Pictures/Edit.png" alt="">
                        <p>Edit Story</p>
                </a>
            </div>
            <div class="col-lg-4 col-md-4 col-xs-6 thumb">
                <a class="thumbnail" href="picUpload.jsp">
                    <img class="img-responsive" src="Pictures/upload.gif" alt="Upload Photos">
                    <p>Upload Photos</p>
                </a>
            </div>
            <div class="col-lg-4 col-md-4 col-xs-6 thumb">
                <a class="thumbnail" href="#">
                    <img class="img-responsive" src="Pictures/send.jpg" alt="">
                    <p>Send Story</p>
                </a>
            </div>
            <div class="col-lg-4 col-md-4 col-xs-6 thumb">
                <a class="thumbnail" href="#">
                    <img class="img-responsive" src="Pictures/inbox.png" alt="">
                    <p>Story Inbox</p>
                </a>
            </div>
        </div> 
            </div>
                      <%}
                            }else{
                                %>
                                <%
                                        
                            
                    }%>
    </body>
</html>