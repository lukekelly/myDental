<%-- 
    Document   : Comments
    Created on : 11-Mar-2016, 16:16:18
    Author     : Luke
--%>

<%@page import="stores.Comment"%>
<%@page import="java.util.Iterator"%>
<%@page import="stores.Pic"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Library</title>
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
            <% String picID = (String) request.getAttribute("picID");%>

            <a href="/myDental/Image/<%=picID%>" ><img src="/myDental/Thumb/<%=picID%>"></a>

            <%
                java.util.LinkedList<Comment> comments = (java.util.LinkedList<Comment>) request.getAttribute("Comments");
                if (comments == null) { %>
            <p>No comments found</p>
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
                <p><input type="text" name="comment"></p>
                <p><input type="submit" value="Add Comment"></p>
            </form>
        </div>
    </body>
</html>
