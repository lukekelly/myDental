<%-- 
    Document   : FissureSealentDentist
    Created on : 05-May-2016, 23:30:10
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
        <title>Fissure Sealent</title>
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
                    <li><a href="ViewStories.jsp">Stories <span class="glyphicon glyphicon-book"></span></a></li>
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

        <div class="container">
            <div class="row">
                <%                    if (lg != null) {
                        if (lg.getloggedin()) {

                %>
                <div class="col-lg-12">
                    <h1 class="page-header"> Fissure Sealent Appointment</h1>
                </div>
                <%
                } else {%>
                <%}%>
                <%
                    java.util.LinkedList<Pic> lsPics = (java.util.LinkedList<Pic>) request.getAttribute("allPics");
                    int lsFlags = 0;

                    if (lsPics == null) {
                %>
                <p>No Stories Found</p>

                <%
                } else {
                    Iterator<Pic> iterator = lsPics.iterator();
                  for (int i = 0; i < lsPics.size(); i++) {
                        Pic p = (Pic) iterator.next();
                        lsFlags = picMod.getFlagsForPic(p.getSUUID());
                        //Here we are trying to check if the patient has been sent any pictures by the dentist             
                        
                        if (lsFlags != 0) {%>



                <form>	
                    <input type="text" name="flags" value="<%=picMod.getFlagsForPic(p.getSUUID())%>" hidden>           
                    <input type="text" name="picid" value="<%=p.getSUUID()%>" hidden> 
                    <input type="text" name="login" value="<%=lg.getUsername()%>" hidden> 
                    <input type="text" name="sendto" value="<%=p.getSendto()%>" hidden> 
                    <input type="text" name="page" value="login" hidden >  		
                    <a href="/myDental/Comments/<%=p.getSUUID()%>" class="btn btn-info" role="button" style="position: relative; z-index: 1;">Notes <span class="glyphicon glyphicon-comment"></span></a>
                    <button class="btn btn-danger" style="position: relative; z-index: 1;" disabled><img src="Pictures/worried.PNG" alt="worried" height="70" width="70"/></button>
                </form>
                <%      } else {%>

                <form method="POST" action="/myDental/Flag">	
                    <input type="text" name="flags" value="<%=picMod.getFlagsForPic(p.getSUUID())%>" hidden>
                  <!--  <a name="flags"><span class="badge"><%=picMod.getFlagsForPic(p.getSUUID())%></span></a> -->
                    <input type="text" name="picid" value="<%=p.getSUUID()%>" hidden> 
                    <input type="text" name="login" value="<%=lg.getUsername()%>" hidden>
                    <input type="text" name="sendto" value="<%=p.getSendto()%>" hidden>
                    <input type="text" name="page" value="login" hidden >  			
                    <a href="/myDental/Comments/<%=p.getSUUID()%>" class="btn btn-info" role="button"> Notes <span class="glyphicon glyphicon-comment"></span></a>
                    <button class="btn btn-success" disabled><img src="Pictures/notworried.PNG" alt="Not Worried" height="70" width="70"/></button>
                </form>

                <%  }%>            

                <div class="pictureAndTexDiv">
                    <div class="cell">
                        <a><img src="/myDental/Thumb/<%=p.getSUUID()%>" style="position: relative; z-index: 1;" height="600"></a><br/><%
                            if (p.getCaption().isEmpty()) {
                            } else {%>

                        <span class="text"><%out.println(p.getCaption());%></span> </div>
                    <textarea id="text" hidden><%out.println(p.getCaption());%></textarea>

                    <button onclick="responsiveVoice.speak($('#text').val(), 'UK English Female');" type='button' value='PLAY' class="btn btn-warning"> <span class="glyphicon glyphicon-volume-up"></span></button>

                </div>






                <%  }
            }
       }

                    }
    
                
        
                %>

            </div>

        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="http://responsivevoice.org/responsivevoice/responsivevoice.js"></script>

    </body>

</html>
