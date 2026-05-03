<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%@page import="control.ConnectionManager" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Vehicle Monitoring</title>
</head>
<body> <%
            String user_id = null;                                     // at initiall all values will null
            if (session.getAttribute("username") != null) {
                user_id = (String) session.getAttribute("username");

        %>
       
<%@include file="header.jsp"%>
         <div class="wrap">
<div class="slider">
	<div class="fluid_container">
        <div class="camera_wrap camera_magenta_skin" id="camera_wrap_1">
        	 <div data-src="images/1.jpeg" >
                <div class="camera_caption fadeFromBottom"> </div>
            </div>
             <div  data-src="images/2.jpeg" >
             	<div class="camera_caption fadeFromBottom"> </div>
            </div>
               <div  data-src="images/1.jpeg" >
             	<div class="camera_caption fadeFromBottom"> </div>
            </div>
	       </div>
	       <div class="clear"></div>
	</div>
	</div>
	</div>
        <%
            } else {
                response.sendRedirect("index.jsp");
            }
        %>
        <%@include file="footer.jsp"%>
    </body>
</html>