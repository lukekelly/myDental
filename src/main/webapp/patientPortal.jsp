<%-- 
    Document   : patientPortal
    Created on : 20-Jan-2016, 16:40:09
    Author     : Luke
--%>
<%@page import="stores.LoggedIn"%>
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
                        <li><a href="/myDental">Home</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        
        
        
            <div id="sliderFrame">
        <div id="slider">
            <img src="slide-1.jpg" alt="Caption for slide 1" />
            <img src="slide-2.jpg" />
            <a href="http://menucool.com"><img src="slide-3.jpg" /></a>
            <img src="slide-4.jpg" />
            <img src="slide-5.jpg" alt="Caption for slide 5" />
        </div>
    </div>
        
        
</body>   
</html>