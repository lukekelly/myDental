<%-- 
    Document   : DentalPics
    Created on : 21-Feb-2016, 18:10:12
    Author     : Luke
--%>

<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import= "stores.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MyDental</title>
        <link rel="stylesheet" type="text/css" href="Styles.css" />
    </head>
    <body>
        <header>
        
        <h1>Dental Library</h1>
        </header>
 
        <article>
            
            <%
                LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
                if (lg != null) {
                    if (lg.getloggedin()) {
            %>
            <h2><%=lg.getUsername()%>'s pics</h2>
            <%}
                }else{%>
            <h1>Your Pics</h1>
                <%}%>
        <%
            java.util.LinkedList<Pic> lsPics = (java.util.LinkedList<Pic>) request.getAttribute("Pics");
            if (lsPics == null) {
        %>
        <p>No Pictures found</p>
        <%
        } else {
            Iterator<Pic> iterator;
            iterator = lsPics.iterator();
            while (iterator.hasNext()) {
                Pic p = (Pic) iterator.next();

        %>
        <a href="/myDental/Image/<%=p.getSUUID()%>" ><img src="/myDental/Thumb/<%=p.getSUUID()%>"></a><br/><%

            }
            }
        %>
        </article>
    </body>
</html>
