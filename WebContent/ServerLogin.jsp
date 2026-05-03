<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Deduplication System</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<script>
</script>
</head>
<body>

                <%@include file="Loheader.jsp" %>
                
                
<div class="wrap">
<div class="col span_2_of_3">
				  <div class="contact-form">
				  	<h3>Admin Login Form</h3>
				  	
					      <form action="Admin" name="f1" method="post" id="f1">
					     <%String user = request.getParameter("user"); 
					     
					     if("invalid".equals(user)){
					     
					     %>
					     <label style="color: red"> Invalid user name and password</label>
					     
					     <%} %>
					      
					    	<div>
						    	<span><label class="labelform">Username</label></span>
						    	<span><input name="uid" type="text" class="textbox" placeholder="User Name" maxlength="45" required="required" ></span>
						  		<span><label id="t4"></label> </span> 	
						    </div>
						    <div>
						    	<span><label class="labelform">Password</label></span>
						    	<span><input  name="password" type="password" class="textbox"  maxlength="45" required="required"  ></span>
						    	<span><label id="t5"></label></span>
						    </div>
						     
						   <div>
						   		<span><input type="submit" value="Login" onclick="checkButton()"></span>
						  </div>
						  <input type="hidden" name="page" value="adminlogin">
					    </form>
				    </div>
  				</div>		
  						
  				<div class="clear"></div>
</div>
<%@include file="footer.jsp"%>
                
                
                
               <%--  <div class="clr"></div>
            </div>
  <div class="hbg"><%@include file="image.jsp" %></div>
  <div class="content">
    <div class="mainbar">
      <div class="article">
          <h2 align="center">Server Login<br />
          </h2>
       <form action="ServerLogin" name="f1" method="post" id="f1">

<table align="center">
	
        <tr><td><br></br></td></tr>
	<tr>
		<td>User Name</td>
		<td><input type="text" class="style5" name="uid" /></td>
		<td><label id="t4"></label></td>
	</tr>
        <tr><td><br></td></tr>
	<tr>
		<td>Password</td>
		<td><input type="password" name="pwd" id="pwd" class="style5" /></td>
		<td><label id="t5"></label></td>
	</tr>
        <tr><td><br></td></tr>
	<tr>
		<td></td>
		<td><input type="submit" value="Login" class="style5" onclick="checkButton()"/></td>
		<td><label></label></td>
	</tr>
        <tr><td><br></td></tr>

</table>

</form>
      </div>
    
      <!--<div class="pagenavi"><span class="pages">Page 1 of 2</span><span class="current">1</span><a href="#">2</a><a href="#" >&raquo;</a></div>-->
    </div>
    
    <div class="clr"></div>
  </div>
  <div class="clr"></div>
 <div class="footer">
             <%@include file="footer.jsp" %>
       			        
            </div>
            </div>
            </body> --%>
</html>