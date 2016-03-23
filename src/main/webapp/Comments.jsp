<%-- 
    Document   : Comments/Notes
    Created on : 11-Mar-2016, 16:16:18
    Author     : Luke
--%>

<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import= "stores.*" %>
<%@ page import= "models.*" %>
<%@ page import= "servlets.*" %>
<%@ page import="lib.CassandraHosts"%>
<%@ page import="com.datastax.driver.core.Cluster"%>
<%@ page import="java.util.LinkedList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Image Notes</title>
        <link rel="icon" type="image/png" href="MyDental.png"/>
        <link href="Styles.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">  
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

        <div class="container-fluid">
            <% String picID = (String) request.getAttribute("picID");%>

            <a href="/myDental/Image/<%=picID%>" ><img src="/myDental/Thumb/<%=picID%>"></a>



            <%
                java.util.LinkedList<Comment> comments = (java.util.LinkedList<Comment>) request.getAttribute("Comments");
                if (comments == null) { %>
            <% } else { %>
            <h3>Comments</h3>
            <% Iterator<Comment> iterator = comments.iterator();
                while (iterator.hasNext()) {
                    Comment comment = iterator.next();
            %><table border=""><tr>
                    <td><%=comment.getUser()%></td>
                    <td><%=comment.getDateCreated()%></td>
                </tr>
                <tr>
                    <td colspan="2"><%=comment.getContent()%></td>
                </tr></table><br>
                <% } %>

            <br>
            <% }
            %>


            <form method="POST" action="newComment">
                <input type="hidden" name="picID" value="<%=picID.toString()%>">
                <p><input type="text" name="comment" placeholder="Write your notes here.."></p>
                <button type="submit" class="btn btn-success" role="button">Add Note</button>
            </form>
        </div>
    </body>
</html>
