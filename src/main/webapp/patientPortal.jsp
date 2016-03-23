<%-- 
    Document   : patientPortal
    Created on : 20-Jan-2016, 16:40:09
    Author     : Luke
--%>
<%@page import="stores.LoggedIn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@ page import= "stores.*" %>
<%@ page import= "models.*" %>
<%@ page import="lib.CassandraHosts"%>
<%@ page import="com.datastax.driver.core.Cluster"%>
<%@ page import="java.util.LinkedList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Patient Portal</title>
        <link rel="icon" type="image/png" href="MyDental.png"/>
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <link href="Styles.css" type="text/css" rel="stylesheet"> 
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
 <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
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
      
            <%  LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");%>
            <%
                Cluster cluster = null;
                cluster = CassandraHosts.getCluster();

                PicModel picMod = new PicModel();
                picMod.setCluster(cluster);


            %>
        </nav> 

        <div class="container">

            <div class="row">

                <%                    if (lg != null) {
                        if (lg.getloggedin()) {

                %>
                <div class="col-lg-12">
                    <h1 class="page-header"><%=lg.getUsername()%>'s Picture Library</h1>
                </div>
                <%}
                } else {%>
                <h1>Your uploaded Images</h1>
                <%}%>
                <%
                    java.util.LinkedList<Pic> lsPics = (java.util.LinkedList<Pic>) request.getAttribute("Pics");
                    int lsFlags = 0;
                    if (lsPics == null) {
                %>
                <p>No Pictures found</p>
                <%
                } else {
                    Iterator<Pic> iterator;
                    iterator = lsPics.iterator();
                    while (iterator.hasNext()) {
                        Pic p = (Pic) iterator.next();
                        lsFlags = picMod.getFlagsForPic(p.getSUUID());
                %>
                <div class="container-fluid">
                    <form method="POST" action="/myDental/Flag">	
                        <input type="text" name="flags" value="<%=picMod.getFlagsForPic(p.getSUUID())%>" hidden>
                        <a name="flags"><span class="badge"><%=picMod.getFlagsForPic(p.getSUUID())%></span></a>
                        <input type="text" name="picid" value="<%=p.getSUUID()%>" hidden> 
                        <input type="text" name="login" value="<%=lg.getUsername()%>" hidden>  
                        <input type="text" name="page" value="login" hidden >  			
                        <button type="submit" class="btn btn-danger" role="button"><img src="Pictures/!.jpg" alt="" height="30" width="30"/></button>	
                        
                        <a href="/myDental/Comments/<%=p.getSUUID()%>" class="btn btn-info" role="button">Notes</a>
                    </form>


                    <a><img src="/myDental/Thumb/<%=p.getSUUID()%>"></a><br/><%
                                if (p.getCaption().isEmpty()) {
                                } else {
                                    out.println(p.getCaption());
                                }
                            }
                        }
                        %>
                </div>
            </div>




        </div>


 

<div class="container">
  <br>
  <h1>Check Up</h1>
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">

      <div class="item active">
        <img src="Pictures/reception.jpg" alt="Reception" width="460" height="345">
        <div class="carousel-caption">
          <h3>You will go to the reception and sign in</h3>
        </div>
      </div>

      <div class="item">
        <img src="Pictures/image2_1.jpg" alt="Chania" width="460" height="345">
        <div class="carousel-caption">
          <h3>The Dentist will review your treatment with you</h3>
        </div>
      </div>
    
      <div class="item">
        <img src="img_flower.jpg" alt="Flower" width="460" height="345">
        <div class="carousel-caption">
          <h3>Flowers</h3>
          <p>Beatiful flowers in Kolymbari, Crete.</p>
        </div>
      </div>

      <div class="item">
        <img src="img_flower2.jpg" alt="Flower" width="460" height="345">
        <div class="carousel-caption">
          <h3>Flowers</h3>
          <p>Beatiful flowers in Kolymbari, Crete.</p>
        </div>
      </div>
  
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
        
 
        
</body>   
</html>