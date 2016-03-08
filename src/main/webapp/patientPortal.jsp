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
                        <li><a href="/myDental/logout">Logout</a></li>
                    </ul>
                </div>
            </div>
        </nav>

<div class="container">
	<div id="content-slider">
    	<div id="slider">
        	<div id="mask">
            <ul>
           	<li id="first" class="firstanimation">
            <a href="#">
            <img src="Pictures/desk.jpg" alt="Cougar"/>
            </a>
            <div class="tooltip">
            <h1>Reception</h1>
            </div>
            </li>

            <li id="second" class="secondanimation">
            <a href="#">
            <img src="Pictures/download.jpg" alt="Lions"/>
            </a>
            <div class="tooltip">
            <h1>Waiting Room</h1>
            </div>
            </li>
            
            <li id="third" class="thirdanimation">
            <a href="#">
            <img src="Pictures/image2_1.jpg" alt="Snowalker"/>
            </a>
            <div class="tooltip">
            <h1>Dentist</h1>
            </div>
            </li>
            </ul>
            </div>
            <div class="progress-bar"></div>
        </div>
    </div>
</div>
</body>   
</html>