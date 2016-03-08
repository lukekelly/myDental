<%-- 
    Document   : createNewStory
    Created on : 22-Feb-2016, 16:41:34
    Author     : Luke
--%>

<%@page import="stores.LoggedIn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>New Story</title>
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
                        <li><a href="/myDental/DentistPortal">Dental Portal Home</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <%

            LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
            if (lg != null) {
                String username = lg.getUsername();
                if (lg.getloggedin()) {
        %>

        <div class="container">

            <div class="row">

                <div class="col-lg-12">
                    <h1 class="page-header">Create a new story</h1>
                </div>
                <INPUT type="button" value="Add Slide" onclick="addRow('dataTable')" />

                <INPUT type="button" value="Delete Slide" onclick="deleteRow('dataTable')" />

                <TABLE id="dataTable" width="350px" border="1">
                    <TR>
                        <TD><INPUT type="checkbox" name="chk"/></TD>
                        <TD><INPUT type="button" value="Add Image"/></TD>
                        <TD>
                            Description : <br />
                            <textarea rows="5" cols="50" name="description">
Enter description here...
                            </textarea>
                        </TD>
                    </TR>
                </TABLE>
            </div>
        </div>


        <%}
        } else {
        %>
        <%
            }%>



        <script>
            function addRow(tableID) {

                var table = document.getElementById(tableID);

                var rowCount = table.rows.length;
                var row = table.insertRow(rowCount);

                var colCount = table.rows[0].cells.length;

                for (var i = 0; i < colCount; i++) {

                    var newcell = row.insertCell(i);

                    newcell.innerHTML = table.rows[0].cells[i].innerHTML;
                    //alert(newcell.childNodes);
                    switch (newcell.childNodes[0].type) {
                        case "text":
                            newcell.childNodes[0].value = "";
                            break;
                        case "checkbox":
                            newcell.childNodes[0].checked = false;
                            break;
                        case "select-one":
                            newcell.childNodes[0].selectedIndex = 0;
                            break;
                    }
                }
            }

            function deleteRow(tableID) {
                try {
                    var table = document.getElementById(tableID);
                    var rowCount = table.rows.length;

                    for (var i = 0; i < rowCount; i++) {
                        var row = table.rows[i];
                        var chkbox = row.cells[0].childNodes[0];
                        if (null != chkbox && true == chkbox.checked) {
                            if (rowCount <= 1) {
                                alert("Cannot delete all the rows.");
                                break;
                            }
                            table.deleteRow(i);
                            rowCount--;
                            i--;
                        }


                    }
                } catch (e) {
                    alert(e);
                }
            }

        </script>
    </body>
</html>