<%@page import="java.util.ArrayList"%>
<%@page import="control.Admin"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="control.GlobalFunction"%>

<%@page import="control.ConnectionManager" %>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    <style>
/*the container must be positioned relative:*/
.custom-select {
  position: relative;
  font-family: Arial;
}

.custom-select select {
  display: none; /*hide original SELECT element:*/
}

.select-selected {
  background-color: DodgerBlue;
}

/*style the arrow inside the select element:*/
.select-selected:after {
  position: absolute;
  content: "";
  top: 14px;
  right: 10px;
  width: 0;
  height: 0;
  border: 6px solid transparent;
  border-color: #fff transparent transparent transparent;
}

/*point the arrow upwards when the select box is open (active):*/
.select-selected.select-arrow-active:after {
  border-color: transparent transparent #fff transparent;
  top: 7px;
}

/*style the items (options), including the selected item:*/
.select-items div,.select-selected {
  color: #ffffff;
  padding: 8px 16px;
  border: 1px solid transparent;
  border-color: transparent transparent rgba(0, 0, 0, 0.1) transparent;
  cursor: pointer;
  user-select: none;
}

/*style items (options):*/
.select-items {
  position: absolute;
  background-color: DodgerBlue;
  top: 100%;
  left: 0;
  right: 0;
  z-index: 99;
}

/*hide the items when the select box is closed:*/
.select-hide {
  display: none;
}

.select-items div:hover, .same-as-selected {
  background-color: rgba(0, 0, 0, 0.1);
}
</style>
        <title>Deduplication System</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <link href="style.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
        <script type="text/javascript" src="js/script.js"></script>
        <script type="text/javascript" src="js/cufon-yui.js"></script>
        <script type="text/javascript" src="js/arial.js"></script>
        <script type="text/javascript" src="js/cuf_run.js"></script>
    </head>
    <body>
    
    
    <%@include file="header.jsp" %>
	
			<div class="jumbotron jumbotron-fluid mb-5">
<div class="col span_2_of_3">
				  <div class="contact-form">
				  	  	   <div class="col-lg-5">
                    <div class="bg-primary py-5 px-4 px-sm-5">
                            <div class="form-group">
     <%
      
        if(request.getParameter("status")!=null){
        out.println("<script>alert('Successfully Uploaded!')</script>");
        }
        
     GlobalFunction GF = new GlobalFunction();
     GF.DeleteFile();
        %>
        <%
        
            String user_id = null;

      
        	if (session.getAttribute("username") != null) {
                user_id = (String) session.getAttribute("username");

        %>
       
                
                
                        <%String check = request.getParameter("check"); 
                        

                        if(request.getParameter("type")!=null && request.getParameter("type").equalsIgnoreCase("realtime")){
                        	   try {
                   				Runtime.getRuntime().exec("  cmd /c start C:\\project\\bat.lnk 0" );
                   				Thread.sleep(2000);
                   			} catch (Exception e1) {
                   				// TODO Auto-generated catch block
                   				e1.printStackTrace();
                   			}
                            }else               if(!"upload".equalsIgnoreCase(check)){
                        %>
                        
                        
                      <form class="form1" action="<%=request.getContextPath() %>/Upload.jsp" method="post"  >
                        
                        <%Admin admin = new Admin();
                      /*   ArrayList<String> folderList = admin.getFileList(); */
                        
                        
                        
                        %>
                        <div>
						     	 	<span>  <select    class="custom-select" name="type">
                        
                        <option value="Realtime">Realtime</option> 
                      
                         
                        </select>
                        </span>
                        <br><br>
						    </div>
                        
                      <%--   <div>
						     	<span><label class="labelform">Server Name</label></span>
						    	<span>  <select name="servername">
                        
                        <%for(int i =0 ; i<folderList.size();i++){ %>
                        <option value="<%= folderList.get(i)%>"><%= folderList.get(i)%></option>
                        <%} %>
                        </select>
                        </span>
						    </div> --%>
						    
						    <input type="hidden" name="servername" value="server 1">
                        
                        
                      
             <input type="hidden" name ="check" value="upload">           
                            
                            	 
                            	
						   		<span><input class="btn btn-dark btn-block border-0 py-3" name="submit" class="form-login" type="submit" title="submit" value="Submit" size="30" maxlength="2048" />
						  </div>
                            	

				  </div>
					    </form>
					    <%}else{
					    	
					    	session.setAttribute("servername",request.getParameter("servername"));
					    	session.setAttribute("type",request.getParameter("type"));
					    	
					    	%>
					    
					     <form class="form1" action="<%=request.getContextPath() %>/Upload" method="post"  enctype="multipart/form-data">
                            	 <div>
						     	<span><label class="labelform">Select File</label></span>
						    	<span>
                            	<input type="hidden" name="user" value="<%=user_id%>" />
                            	<input type="file" value="" name="path" size="30" maxlength="2048" /></td>
</span>
</div>
<div>
	<span><input name="submit" class="form-login" type="submit" title="submit" value="Upload" size="30" maxlength="2048" />
						  </div>
                            	


						   </form>
					    <%} %>
					    <br><br><br><br><br><br><br><br><br><br><br>
				    </div>
  				</div>		
  						
  				<div class="clear"></div>
</div>
     			        
        
        <%
            } else {
                response.sendRedirect("index.jsp");
            }
        %>
    </body>
</html>