<%-- 
    Document   : DentalLogin
    Created on : 01-Feb-2016, 15:40:53
    Author     : Luke
--%>

<%@page import="stores.LoggedIn"%>
<%@page import="servlets.Error" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Login</title>
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

        <%
            Error e = (Error) session.getAttribute("ErrorMessages");
            String errorMessage = "";
            if (e != null) {
                errorMessage = e.getErrorMessage();


        %>
               
        <div class="alert alert-danger" role="alert" align="centre">
            <strong>Oops!</strong><%=errorMessage%> 
        </div>


        <%
            } else {
            }
        %>
   <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">                    
            <div class="panel panel-info" >
                    <div class="panel-heading">
                        <div class="panel-title">Dentist Sign In..</div>
                    </div>     

                    <div style="padding-top:30px" class="panel-body" >

                        <div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>
                            
                        <form class="form-horizontal" role="form" method="POST" action="DentalLogin">
                                    
                            <div style="margin-bottom: 25px" class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                        <input type="text" name="username" class="form-control" placeholder="Username" required autofocus>                                        
                                    </div>
                                
                            <div style="margin-bottom: 25px" class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                        <input type="password" name="password" class="form-control" placeholder="Password" required>
                                    </div>
   
                            <div style="margin-top:10px" class="form-group">
                                    <!-- Button -->

                                    <div class="col-sm-12 controls">
                                      <button class="btn btn-lg btn-success btn-block" type="submit">Login</button>
                                    </div>
                                </div>    
                            </form>     
                        </div>                     
                    </div>  
        </div>
    </body>
</html>