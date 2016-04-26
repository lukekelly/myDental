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
          <h3>Springfield Medical Centre</h3>
               <script src='https://code.responsivevoice.org/responsivevoice.js'></script>
                        <input onclick='responsiveVoice.speak("Springfield Medical Centre");' type='button' value='PLAY'/>
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
        <h3>Waiting at reception</h3>
        <input onclick='responsiveVoice.speak("Waiting at reception");' type='button' value='PLAY'/>
      </div>
    </div>

    <div class="item">
         <div class="container-fluid">
                    <form>	  			
                        <button class="btn btn-success" role="button"><img src="Pictures/!.jpg" alt="" height="30" width="30"/></button>	
                        <a class="btn btn-info" role="button">Notes</a>
                    </form>
        </div>
      <img src="Pictures/room.jpg" alt="">
      <div class="carousel-caption">
        <h3>The dentist's room</h3>
        <input onclick='responsiveVoice.speak("The dentists room");' type='button' value='PLAY'/>
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
        <h3>The dental chair will lie back</h3>
        <input onclick='responsiveVoice.speak("The dental chair will lie back");' type='button' value='PLAY'/>
      </div>
    </div>
      
      <div class="item">
           <div class="container-fluid">
                    <form>	  			
                        <button class="btn btn-success" role="button"><img src="Pictures/!.jpg" alt="" height="30" width="30"/></button>	
                        <a class="btn btn-info" role="button">Notes</a>
                    </form>
        </div>
      <img src="Pictures/light.jpg" alt="">
      <div class="carousel-caption">
        <h3>The light will come on</h3>
        <input onclick='responsiveVoice.speak("The light will come on");' type='button' value='PLAY'/>
      </div>
    </div>
      
      
      <div class="item">
           <div class="container-fluid">
                    <form>	  			
                        <button class="btn btn-success" role="button"><img src="Pictures/!.jpg" alt="" height="30" width="30"/></button>	
                        <a class="btn btn-info" role="button">Notes</a>
                    </form>
        </div>
      <img src="Pictures/mirror.jpg" alt="">
      <div class="carousel-caption">
        <h3>The dentist will use a small mirror to see inside my mouth</h3>
        <input onclick='responsiveVoice.speak("The dentist will use a small mirror to see inside my mouth");' type='button' value='PLAY'/>
      </div>
    </div>
      
      
      
      <div class="item">
           <div class="container-fluid">
                    <form>	  			
                        <button class="btn btn-success" role="button"><img src="Pictures/!.jpg" alt="" height="30" width="30"/></button>	
                        <a class="btn btn-info" role="button">Notes</a>
                    </form>
        </div>
      <img src="Pictures/air.jpg" alt="">
      <div class="carousel-caption">
        <h3>The dentist might dry my teeth with some air</h3>
        <input onclick='responsiveVoice.speak("The dentist might dry my teeth with some air");' type='button' value='PLAY'/>
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
        <h3>When the dentist has finished the chair will sit up</h3>
        <input onclick='responsiveVoice.speak("When the dentist has finished the chair will sit up");' type='button' value='PLAY'/>
      </div>
    </div>
      
      
     <div class="item">
           <div class="container-fluid">
                    <form>	  			
                        <button class="btn btn-success" role="button"><img src="Pictures/!.jpg" alt="" height="30" width="30"/></button>	
                        <a class="btn btn-info" role="button">Notes</a>
                    </form>
        </div>
      <img src="Pictures/wash.jpg" alt=""/>
      <div class="carousel-caption">
        <h3>I can rinse my mouth if I wish</h3>
        <input onclick='responsiveVoice.speak("I can rinse my mouth if i wish");' type='button' value='PLAY'/>
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
            
            



                <%
                    java.util.LinkedList<Pic> lsPics = (java.util.LinkedList<Pic>) request.getAttribute("Pics");
                    int lsFlags = 0;
                    if (lsPics == null) {
                %>
                <p><strong>You have made no stories yet!</strong></p>
                <%
                } else {
                    Iterator<Pic> iterator;
                    iterator = lsPics.iterator();
                    while (iterator.hasNext()) {
                        Pic p = (Pic) iterator.next();
                        lsFlags = picMod.getFlagsForPic(p.getSUUID());

                        if (lsFlags != 0) {%>

                <div class="container-fluid">
                    <form>	
                        <input type="text" name="flags" value="<%=picMod.getFlagsForPic(p.getSUUID())%>" hidden>           
                        <input type="text" name="picid" value="<%=p.getSUUID()%>" hidden> 
                        <input type="text" name="login" value="<%=lg.getUsername()%>" hidden>  
                        <input type="text" name="page" value="login" hidden >  			
                        <button class="btn btn-danger" role="button" disabled><img src="Pictures/!.jpg" alt="" height="30" width="30"/></button>	
                        <a href="/myDental/Comments/<%=p.getSUUID()%>" class="btn btn-info" role="button">Notes</a>
                    </form>
                    <%      } else {%>
                    <div class="container-fluid">
                        <form method="POST" action="/myDental/Flag">	
                            <input type="text" name="flags" value="<%=picMod.getFlagsForPic(p.getSUUID())%>" hidden>
                          <!--  <a name="flags"><span class="badge"><%=picMod.getFlagsForPic(p.getSUUID())%></span></a> -->
                            <input type="text" name="picid" value="<%=p.getSUUID()%>" hidden> 
                            <input type="text" name="login" value="<%=lg.getUsername()%>" hidden>  
                            <input type="text" name="page" value="login" hidden >  			
                            <button type="submit" class="btn btn-success" role="button" disabled><img src="Pictures/!.jpg" alt="" height="30" width="30"/></button>	
                            <a href="/myDental/Comments/<%=p.getSUUID()%>" class="btn btn-info" role="button">Notes</a>
                        </form>

                        <%  }
                        %>

                        <a><img src="/myDental/Thumb/<%=p.getSUUID()%>"></a><br/><%
                            if (p.getCaption().isEmpty()) {
                            } else {%>

                        <div>
                            <b><strong><%out.println(p.getCaption());%></strong></b>
                        </div>
                       
                        <form method="POST" action="EditPic">
                            <input type="text" name="user" value="<%=p.getUser()%>"  >
                            <input name="picid" value="<%=p.getSUUID()%>" >
                            <input type="text" name="caption" placeholder="Enter a new caption here..">
                            </br>													
                            <input type="submit" value="Submit Change"> 	</br>
                        </form> 
                        <%  }
                                    }
                                }
                            }
                        %>

                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

        
</body>   
</html>