
    <%@page import="control.EMail"%>
<%@page import="control.ConnectionManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="control.DAO"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.PrintWriter"%>
<body>
    </body>
     <% 
     String event = request.getParameter("event");
     String id = request.getParameter("id");
     String name2 = request.getParameter("file");
     String key = request.getParameter("key");
     //String email = request.getParameter("u");

    	 String name1 = request.getParameter("key");
    	 String a =request.getParameter("file"); 
    	 try{
    	 //FileInputStream fileInputStream = new FileInputStream("D:\\Upload\\server 1\\" + request.getParameter("file")+name1);
    	 
    	 
     response.setContentType("APPLICATION/OCTET-STREAM");   
     response.setContentType("text/html");  
     PrintWriter out1 = response.getWriter();
     response.setHeader("Content-Disposition","attachment; filename=\"" + name2 + "\"");   
     FileInputStream    fileInputStream = new FileInputStream("C:\\" + name2);  
     int i;   
     while ((i=fileInputStream.read()) != -1) {  
     out1.write(i);   
     }   
     fileInputStream.close();   
     out1.close();   
    	 }catch(Exception e)
    	 {
    		 System.out.println("Key not matched");
    	 }

response.sendRedirect("download.jsp");

     
         
         
        %>
            
            
        <label> File Shared Successfully</label>
</html>
