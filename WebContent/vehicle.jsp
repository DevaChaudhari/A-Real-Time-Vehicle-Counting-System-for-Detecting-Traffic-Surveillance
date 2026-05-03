<%@page import="control.DAO"%>
<%@page import="java.util.Base64"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<%
	String isuccess = (String) request.getAttribute("username");
%>
</head>
<body>
 
    <%@include file="header.jsp" %>
    <div class="col span_2_of_3">

				  <div class="contact-form">
				  
				  	  	   <div class="col-lg-5">
				  	  	   	
		       <h2>Traffic Count at</h2><br> <h2><%=request.getParameter("t") %></h2>
		       <br><br>
		          <div class="contact-form">
					     <form method="post" action="<%=request.getContextPath()%>/RegServlet"  class="left_form">
					     					 <%if("invalid".equals(isuccess))
    	{%>
    	<span style="color: red">Invalid username or password .</span><!--END DESCRIPTION-->
    	
    	<%
    	request.setAttribute("message","");}
					     					String base64Image = "";
					     					 String sql = "SELECT * FROM imagevalue where time=? ";
					     			         
					     			        try  {
					     			        	DAO data=new DAO();
					     			   		Connection conn=data.getConnection();
					     			            PreparedStatement statement = conn.prepareStatement(sql);
					     			            statement.setString(1, request.getParameter("t"));
					     			            ResultSet result = statement.executeQuery();
					     			             
					     			            if (result.next()) {
					     			             
					     			            	Blob blob = result.getBlob(1);
					     			                InputStream inputStream = blob.getBinaryStream();
					     			                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
					     			                byte[] buffer = new byte[4096];
					     			                int bytesRead = -1;
					     			                 
					     			                while ((bytesRead = inputStream.read(buffer)) != -1) {
					     			                    outputStream.write(buffer, 0, bytesRead);                  
					     			                }
					     			                 
					     			                byte[] imageBytes = outputStream.toByteArray();
					     			                base64Image = Base64.getEncoder().encodeToString(imageBytes);
					     			                 
					     			                 
					     			                inputStream.close();
					     			                outputStream.close();
					     			                 
					     			            }          
					     			             
					     			        } catch (Exception ex) {
					     			            ex.printStackTrace();
					     			            throw ex;
					     			        }      
					     			         
    	
    	
    	%>
    
	
					    	<div>
						    	<span style="float: right;"><label style="color: white">
  <img src="data:image/jpg;base64,<%=base64Image %>" width="340" height="300"/>	</label></span>					    </div>
						 
 				    </div>
						    
		
						
						  <input type="hidden" value="getInfo"name = "action">
					    <div class="clear"></div>
				  </div>
				  </div>
				  </div>
				  
</body>
</html>