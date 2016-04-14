<%-- 
    Document   : checkup
    Created on : 13-Apr-2016, 10:44:53
    Author     : Luke
--%>
<%@page import= "java.util.Iterator"%>
<%@page import= "com.datastax.driver.core.Cluster"%>
<%@page import= "lib.CassandraHosts"%>
<%@page import= "models.PicModel"%>
<%@page import= "stores.Pic"%>
<%@page import= "stores.LoggedIn"%>
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
                  <ul class="nav navbar-nav">
                        <li><a href="patientPortal.jsp">Patient Portal Home</a></li>
                    </ul>
                 <div class="collapse navbar-collapse" id="myNavbar">
                    
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="/myDental/logout">Logout</a></li>
                    </ul>
                </div>
            </div>
      
            <%  LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
                Cluster cluster = null;
                cluster = CassandraHosts.getCluster();

                PicModel picMod = new PicModel();
                picMod.setCluster(cluster);
            %>
        </nav> 

        <div class="container">
              <%                    if (lg != null) {
                    if (lg.getloggedin()) {

            %>
          <div id="myCarousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
    <li data-target="#myCarousel" data-slide-to="3"></li>
    <li data-target="#myCarousel" data-slide-to="4"></li>
    <li data-target="#myCarousel" data-slide-to="5"></li>
    <li data-target="#myCarousel" data-slide-to="6"></li>
    <li data-target="#myCarousel" data-slide-to="7"></li>
    <li data-target="#myCarousel" data-slide-to="8"></li>
    <li data-target="#myCarousel" data-slide-to="9"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
        <div class="container-fluid">
                    <form>	  			
                        <button class="btn btn-success" role="button"><img src="Pictures/!.jpg" alt="" height="30" width="30"/></button>	
                        <a class="btn btn-info" role="button">Notes</a>
                    </form>
        </div>
      <img src="Pictures/1.PNG.jpg" alt="">
      <div class="carousel-caption">
        <h3>I will arrive at the dentist</h3>
      </div>
    </div>

    <div class="item">
         <div class="container-fluid">
                    <form>	  			
                        <button class="btn btn-success" role="button"><img src="Pictures/!.jpg" alt="" height="30" width="30"/></button>	
                        <a class="btn btn-info" role="button">Notes</a>
                    </form>
        </div>
      <img src="Pictures/2.PNG.jpg" alt="">
       <div class="carousel-caption">
        <h3>I will sign in at reception</h3>
      </div>
    </div>

    <div class="item">
         <div class="container-fluid">
                    <form>	  			
                        <button class="btn btn-success" role="button"><img src="Pictures/!.jpg" alt="" height="30" width="30"/></button>	
                        <a class="btn btn-info" role="button">Notes</a>
                    </form>
        </div>
      <img src="Pictures/3.PNG.jpg" alt="">
      <div class="carousel-caption">
        <h3>I will take a seat in the waiting room</h3>
      </div>
    </div>
      <div class="item">
           <div class="container-fluid">
                    <form>	  			
                        <button class="btn btn-success" role="button"><img src="Pictures/!.jpg" alt="" height="30" width="30"/></button>	
                        <a class="btn btn-info" role="button">Notes</a>
                    </form>
        </div>
      <img src="Pictures/4.PNG.jpg" alt="">
      <div class="carousel-caption">
        <h3>The dentist will call me in</h3>
      </div>
    </div>
      <div class="item">
           <div class="container-fluid">
                    <form>	  			
                        <button class="btn btn-success" role="button"><img src="Pictures/!.jpg" alt="" height="30" width="30"/></button>	
                        <a class="btn btn-info" role="button">Notes</a>
                    </form>
        </div>
      <img src="Pictures/5.PNG.jpg" alt="">
      <div class="carousel-caption">
        <h3>I will sit in the dentists chair</h3>
      </div>
    </div>
      <div class="item">
           <div class="container-fluid">
                    <form>	  			
                        <button class="btn btn-success" role="button"><img src="Pictures/!.jpg" alt="" height="30" width="30"/></button>	
                        <a class="btn btn-info" role="button">Notes</a>
                    </form>
        </div>
      <img src="Pictures/6.PNG.jpg" alt="">
      <div class="carousel-caption">
        <h3>The chair will lean backwards</h3>
      </div>
    </div>
      <div class="item">
           <div class="container-fluid">
                    <form>	  			
                        <button class="btn btn-success" role="button"><img src="Pictures/!.jpg" alt="" height="30" width="30"/></button>	
                        <a class="btn btn-info" role="button">Notes</a>
                    </form>
        </div>
      <img src="Pictures/7.PNG.jpg" alt="">
      <div class="carousel-caption">
        <h3>The dentist will put a mirror in my mouth</h3>
      </div>
    </div>
      <div class="item">
           <div class="container-fluid">
                    <form>	  			
                        <button class="btn btn-success" role="button"><img src="Pictures/!.jpg" alt="" height="30" width="30"/></button>	
                        <a class="btn btn-info" role="button">Notes</a>
                    </form>
        </div>
      <img src="Pictures/10.PNG.jpg" alt="">
      <div class="carousel-caption">
        <h3>The dentist will put toothpaste on my teeth</h3>
      </div>
    </div>
      <div class="item">
           <div class="container-fluid">
                    <form>	  			
                        <button class="btn btn-success" role="button"><img src="Pictures/!.jpg" alt="" height="30" width="30"/></button>	
                        <a class="btn btn-info" role="button">Notes</a>
                    </form>
        </div>
      <img src="Pictures/14.png.jpg" alt="">
      <div class="carousel-caption">
        <h3>I will rinse my mouth out</h3>
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
                    <% } else {%>
            <h1>Patient Portal: Not Logged In</h1>
            <%  }}  %>
        
</body>   
</html>