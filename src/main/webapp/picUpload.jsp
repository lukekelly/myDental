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
                <div class="collapse navbar-collapse" id="myNavbar">

                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="/myDental">Home</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <a href="dentistPortal.jsp" class="btn btn-info" role="button">Dental Portal</a>
        

        <div class="container-fluid">
            <h1>Upload Image</h1>
            <form method="POST" enctype="multipart/form-data" action="Image">
                <input type="file" name="upfile">
                <input type="text" name="caption" placeholder="Enter a caption here.." hidden><br/>
                <input type="text" name="sendTo" placeholder="Pick Patient.." hidden="">
                <button type="submit" class="btn btn-success" role="button">Upload Image</button>
            </form>      
        </div>


    </body>

    <%}
    } else {

    %>
    <%        }%>
</html>