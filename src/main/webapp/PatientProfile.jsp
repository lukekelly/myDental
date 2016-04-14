<%-- 
    Document   : PatientProfile
    Created on : 12-Apr-2016, 16:05:26
    Author     : Luke
--%>

<%@page import="java.util.Iterator"%>
<%@page import="com.datastax.driver.core.Cluster"%>
<%@page import="lib.CassandraHosts"%>
<%@page import="models.PicModel"%>
<%@page import="stores.Pic"%>
<%@page import="stores.LoggedIn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Patient Profile</title>
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
                        <li><a href="patientPortal.jsp">Home</a></li>
                    </ul>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="/myDental/logout">Logout</a></li>
                    </ul>
                </div>
            </div>
            <%

                LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
                if (lg != null) {
                    String username = lg.getUsername();
                    if (lg.getloggedin()) {
            %>
        </nav>

        <div class="container">
            <div class="row">

                <div class="col-lg-12">
                    <h1 class="page-header"><%=lg.getFirstName()%>'s Profile</h1>
                </div>
            </div>
                <div class="container" style="padding-top: 60px;">
  <div class="row">
    <!-- left column -->
    <div class="col-md-4 col-sm-6 col-xs-12">
      <div class="text-center">
        <img src="Pictures/images.png" class="avatar img-circle img-thumbnail" alt="avatar">
      </div>
          <div class="form-group">
          <div class="col-md-8">
              <span class="badge"><%=lg.getUsername()%></span>
          </div>
        </div>
    </div>
    <!-- edit form column -->
    <div class="col-md-8 col-sm-6 col-xs-12 personal-info">
      <form class="form-horizontal" role="form">
        <div class="form-group">
          <label class="col-lg-3 control-label">First name:</label>
          <div class="col-lg-8">
            <input class="form-control" value="<%=lg.getFirstName()%>" type="text">
          </div>
        </div>
        <div class="form-group">
          <label class="col-lg-3 control-label">Last name:</label>
          <div class="col-lg-8">
            <input class="form-control" value="<%=lg.getSecondName()%>" type="text">
          </div>
        </div>
        <div class="form-group">
          <label class="col-lg-3 control-label">Address</label>
          <div class="col-lg-8">
            <input class="form-control" value="" type="text">
          </div>
        </div>
        <div class="form-group">
          <label class="col-lg-3 control-label">Email:</label>
          <div class="col-lg-8">
            <input class="form-control" value="janesemail@gmail.com" type="text">
          </div>
        </div>
          <div class="form-group">
          <label class="col-lg-3 control-label">Next of Kin/Carer</label>
          <div class="col-lg-8">
            <input class="form-control" value="" type="text">
          </div>
        </div>
        <div class="form-group">
          <label class="col-lg-3 control-label">Pay for treatment?</label>
          <div class="col-lg-8">
            <div class="ui-select">
              <select id="option" class="form-control">
                <option value="No">No</option>
                <option value="Yes">Yes</option>
              </select>
            </div>
          </div>
        </div>
       <div class="form-group">
          <label class="col-lg-3 control-label">Adults Within Capacity applies?</label>
          <div class="col-lg-8">
            <div class="ui-select">
              <select id="option" class="form-control">
                <option value="No">No</option>
                <option value="Yes">Yes</option>
              </select>
            </div>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-3 control-label"></label>
          <div class="col-md-8">
            <input class="btn btn-primary" value="Save Changes" type="button">
            <span></span>
            <input class="btn btn-default" value="Cancel" type="reset">
          </div>
        </div>
      </form>
    </div>
  </div>
</div>
          
        <!--  <form method="POST" action="UpdateInfo">
 		Username: <input type="text" name="username" value=<%= lg.getUsername() %>  </br>
 		First name: <input type="text" name="firstName">  </br>
 		Last name: <input type="text" name="lastName">  </br>
 				</br>													
 		<input type="submit"	value="Submit change"> 	</br>
  	</form> -->
                
        </div>

        <%
                                     } else {
                                     }
                                 }%>
    </body>
</html>