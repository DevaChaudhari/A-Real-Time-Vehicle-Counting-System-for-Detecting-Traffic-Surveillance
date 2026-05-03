

<%@page import="control.CallSMScAPI"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*" %>
<%@page import="java.sql.Connection"%>
<%@page import="control.ConnectionManager" %>
<%@page import="control.SendMailSSL" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Deduplication System</title>
    </head>
    <body>
        


<%
String uid= request.getParameter("uid");
String pwd= request.getParameter("pwd");
out.println(uid);
out.println(pwd);

try 
{
        ServletContext sc=getServletContext();
// 	String url=sc.getInitParameter("url");
// 	String driver=sc.getInitParameter("driver");
// 	String password=sc.getInitParameter("password");
// 	String username=sc.getInitParameter("username");
	//SendMailSSL SendMail = new SendMailSSL();
	//Class.forName(driver);
	Connection con=ConnectionManager.getConnection();
	System.out.println("Connection established");
        Statement st = con.createStatement();
        ResultSet rst = st.executeQuery("select * from reg where userid='"+uid+"'AND pass='"+pwd+"' ");
        if (rst.next()) 
        {
            out.println("user p1");
          
            session.setAttribute("username", uid);%>

            <% if (session.getAttribute("username").equals(""))
            {                
//                out.println("out of session");
//                response.sendRedirect("index.jsp");
                out.println("<center> <h5><font color=\"green\"><b>Sorry your session is expired<b></font></h5></center>");
            }
            else
                              { 
            	session.setAttribute("usertype", "user");
            	session.setAttribute("em", rst.getString("emailid"));
            	//session.setAttribute("userid", rst.getInt("id"));
            	session.setAttribute("user", rst.getString("userid"));
                String phone = rst.getString("phone");
            	//CallSMScAPI.SMSSender("adugar", "abc123", "91"+phone,"Thank you for Login into the Duplication Application" , "WebSMS", "0");
                response.sendRedirect("Upload.jsp");
                } 
            } 
           else
                               {
              out.println("in else");
                   response.sendRedirect("index.jsp");
            }
   
%>

        

<% } catch (Exception e) 
{
        System.out.println("Exception caught" + e.getMessage());
} %>
    </body>
</html>
