<%@page import="java.util.ArrayList"%>
<%@page import="control.GlobalFunction"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="control.FileUtil"%>
<%@page import="control.ConnectionManager" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Deduplication System</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
       
    </head>
    <body>
     <%
      String type = (String)session.getAttribute("type");
     
     
     
         
        
            String user_id = null;
            if (session.getAttribute("username") != null) {
                user_id = (String) session.getAttribute("username");

        %>
         
    <%@include file="header.jsp" %>
<div class="wrap">
<div class="col span_2_of_3">
				  <div class="contact-form">	<%
						  if("File".equalsIgnoreCase(type)){
				  if( request.getParameter("duplicate")!=null){
    	 %>
    	 
        <label style="color: red"> File is already Present. It is linked to existing File. Thank you for using our Application</label>
        <%  }else
         {%>
        	<label style="color: green"> File is uploaded Successfully.Thank you for using our Application</label>
         <%}
     }}
        %>
    
				  
				  
				  				 <%  
					
					if("Block".equalsIgnoreCase(type))
					{
                		//String digest = GF.getDigest(new FileInputStream(uploadFolder+FileName), md, 2048);
                		ArrayList<Integer> array = (ArrayList<Integer>)session.getAttribute("array");
                		String fb = (String)session.getAttribute("fb");
                		String mb = (String)session.getAttribute("mb");
                		String lb = (String)session.getAttribute("lb");
                    %>
                        
                         
                        
                     <div class="post1s">

                            <div  style="width:90%; height: auto; border: 0px solid #2B70C9; margin-left: auto; margin-right: auto">

                                <form action="StoreContent" method="post" name="form1">
                                    <div class="blockOne">
                                        <div class="sec1"><span style="font-weight: bold;color: black;font-size: 130%">First Block :</span></div>
                                        <div class="sec2"><span>
                                        <input type="hidden" name="fileName" id="fileName" value="<%= session.getAttribute("fileName")%>"></input>
                                        <%if(array.get(0) == 1 ){ %>
                                        <textarea name="firstBlock" id="firstBlock" class="splittextarea" style="color: red"><%= fb.trim()%></textarea>
                                        <%}else{ %>
                                        <textarea name="firstBlock" id="firstBlock" class="splittextarea" style="color: green"><%= fb.trim()%></textarea>
                                        <%} %>
                                        <input type="hidden" name="Block1" id="Block1" value="Block1"></input>
                                        </span></div>
                               
                                </div>
                                
                                <div class="blockOne">
                                    <div class="sec1"><span style="font-weight: bold;color: black;font-size: 130%">Middle Block :</span></div>
                                    <div class="sec2"><span>
                                    <%if(array.get(1) == 1 ){ %>
                                        <textarea name="firstBlock" id="firstBlock" class="splittextarea" style="color: red"><%= mb.trim()%></textarea>
                                        <%}else{ %>
                                        <textarea name="firstBlock" id="firstBlock" class="splittextarea" style="color: green"><%= mb.trim()%></textarea>
                                        <%} %>
                                    <input type="hidden" name="Block2" id="Block2" value="Block2"></input>
                                    </span></div>
                                  
                                </div>
                                
                                <div class="blockOne">
                                    <div class="sec1"><span style="font-weight: bold;color: black;font-size: 130%">Last Block :</span></div>
                                    <div class="sec2"><span>
                                    <%if(array.get(2) == 1 ){ %>
                                        <textarea name="firstBlock" id="firstBlock" class="splittextarea" style="color: red"><%= lb.trim()%></textarea>
                                        <%}else{ %>
                                        <textarea name="firstBlock" id="firstBlock" class="splittextarea" style="color: green"><%= lb.trim()%></textarea>
                                        <%} %>
                                    <input type="hidden" name="Block3" id="Block3" value="Block3"></input>
                                    </span></div>
                                  
                                </div>
                                     
                                           
                                <div style="height: 10%; float: left; width: 100%;border: 0px solid #2B70C9; margin-top: 20px">
                                    <div style="width: 20%; height: 100%; float: left;"><span class="fontT">&nbsp;</span></div>
                                    <div class="fontT" style="width: 30%;height: 100%;  float: left;"><span class="fontT">&nbsp;</span></div>
                                </div>
                            </div>
                        </div>
  </form>
					    <%} %>
					    
				    </div>
  				</div>		
  						
  				<div class="clear"></div>
</div>
<%@include file="footer.jsp"%>       			        
        
      
    </body>
</html>