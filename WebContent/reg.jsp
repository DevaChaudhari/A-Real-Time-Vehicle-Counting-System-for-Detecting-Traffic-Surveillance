      <%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="control.ConnectionManager"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Deduplication System</title>
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/arial.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
<script type="text/javascript" src="validation.js"></script>
<script>

function setTime() {
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!
	var yyyy = today.getFullYear();

	if(dd<10) {
	    dd='0'+dd
	} 

	if(mm<10) {
	    mm='0'+mm
	} 
	today = (yyyy-18) + '-' + mm+'-'+dd;
	
	var date = document.getElementById("startDate");
	
	date.setAttribute("max",today);
	
}

</script>
</head>
<body>
<%
      
        if(request.getParameter("status")!=null){
        out.println("<script>alert('Successfully registred!')</script>");
        }
        
        %>

                <%@include file="Loheader.jsp" %>
                
                
                <!-- Creating registration page -->
             <div class="jumbotron jumbotron-fluid mb-5">
				  <div class="contact-form">
				  <br><br>
				 
				  	  	   <div class="col-lg-5">
                    <div class="bg-primary py-5 px-4 px-sm-5">
                            <div class="form-group">
					        <form action="./reg.jsp" name="f1" id="f1" method="post">
					     <label style="color: red"> Note All fields are mandatory</label>
					      
					    	<div>
						    	<span><input name="fname" id="FNAME" onblur="firstname()" type="text"  class="form-control border-0 p-4"   placeholder="First Name" maxlength="15" required="required" ></span>
						    	<span><label style="visibility: hidden;color: red" id="FNAMEERROR">There is an error</label></span>
						    	
						    	
						    	<span><input type="text"  placeholder="Last Name" maxlength="15"  class="form-control border-0 p-4"   required="required" name="lname" id="LNAME" onblur="lastname()"></span>
						    	<span><label style="visibility: hidden;color: red" id="LNAMEERROR">There is an error</label></div></span>
						    
						    	<span><input name="uid"   type="text"  class="form-control border-0 p-4"   placeholder="User Id" maxlength="15" required="required" name="lname" id="lname" onblur="checkLName()"></span>
						   <br>
						    	<span><input name="emid" id="emid" onblur="checkEId()" type="email"  class="form-control border-0 p-4"   placeholder="Email Id" maxlength="45" required="required" onblur="emailid1()"></span>
						    	<br>
						    	<span><input  type="password"  class="form-control border-0 p-4"   placeholder="Password" maxlength="15" required="required" name="pwd" id="pwd" onblur="checkPwd()"></span>
						    	<br>
						    
						    	<span><input  type="date" id="startDate" onclick="setTime()"  class="form-control border-0 p-4"   placeholder="Date of Birth" maxlength="15" required="required" name="dob"></span>
<BR>
						    	<span><input id="pno" name="pno" type="number"  class="form-control border-0 p-4"   placeholder="Mobile Number" min="1000000000" max="9999999999" required="required">
<br>
						    	<span><textarea rows="10" cols="10" id="ADDRESS" name="address"  class="form-control border-0 p-4"    required="required" maxlength="50" onkeyup="checklength()"></textarea></span>
						    <label>	Left :</label><label id="ADDRESSMSG" style="color:red"> 50</label>
						    
						   		<span><input class="btn btn-dark btn-block border-0 py-3" type="submit" value="Register me"></span>
					    </form>
				    </div>
  				</div>		
  						
  				<div class="clear"></div>
</div>

                
                
                
                
                
                
                
                
                <%-- <div class="clr"></div>
            </div>
  <div class="hbg"><%@include file="image.jsp" %></div>
  <div class="content">
    <div class="mainbar">
      <div class="article">
          <h2 align="center">Registration Form<br />
          </h2>
      <form action="./reg.jsp" name="f1" id="f1">

<table border="0" align="center">
	<tr>
		<td>First Name</td>
		<td><input type="text" class="style5" name="fname" id="fname"
			onblur="checkFName()" /></td>
		<td><label  id="t1" class="style6"></label></td>
	</tr>
        <tr><td><br></td></tr>
	<tr>
		<td>Last Name</td>
		<td><input type="text" class="style5" name="lname" id="lname"
			onblur="checkLName()" /></td>
		<td><label id="t2"></label></td>
	</tr>
        <tr><td><br></td></tr>
	<tr>
		<td>E-mail id</td>
		<td><input type="text" class="style5" name="emid" id="emid"
			onblur="checkEId()" /></td>
		<td><label id="t3"></label></td>
	</tr>
        <tr><td><br></td></tr>
	<tr>
		<td>User Id</td>
		<td><input type="text" class="style5" name="uid" onblur="checkId()" /></td>
		<td><label id="t4"></label></td>
	</tr>
        <tr><td><br></td></tr>
	<tr>
		<td>Password</td>
		<td><input type="password" name="pwd" id="pwd" onblur="checkPwd()" class="style5" /></td>
		<td><label id="t5"></label></td>
	</tr>
        <tr><td><br></td></tr>
	<tr>
		<td>Date of Birth</td>
		<td><input type="text" class="style5" name="dob" /></td>
		<td><label id="t7"></label></td>
	</tr>
        <tr><td><br></td></tr>
	
	<tr>
		<td>Phone No</td>
		<td><input type="text" class="style5" id="pno" name="pno" onblur="checkNo()"/></td>
		<td><label id="t8"></label></td>
	</tr>
        <tr><td></td></tr>
	<tr>
		<td>Address</td>
		<td><textarea  class="style5" name="address" ></textarea></td>
		<td><label id="t9"></label></td>
	</tr>
        <tr><td><br></td></tr>
	<tr>
		<td></td>
		<td><input type="submit" value="Register" class="style5" onclick="checkButton()"/></td>
		<td><label></label></td>
	</tr>
        <tr><td><br></td></tr>
        
        <tr>
		<td></td>
		<td><center> <h4><font color="green"><a href="index.jsp" > click here to login</a></font></h4></center></td>
		<td><label></label></td>
	</tr>

</table>

</form>
      </div>
     
     
    </div>
   
    <div class="clr"></div>
  </div>
  <div class="clr"></div>
 
  
--%>
<%!Connection con=null; %>
<%
try
{
	response.setContentType("text/html");
	String fname=request.getParameter("fname");
	String lname=request.getParameter("lname");
	String emid=request.getParameter("emid");
	String uid=request.getParameter("uid");
	String pwd=request.getParameter("pwd");
	String dob=request.getParameter("dob");
	String pno=request.getParameter("pno");
	String address=request.getParameter("address");
	
	if(fname!=null && lname!=null && emid!=null && uid!=null && pwd!=null)
	{
	Statement st = null;
	ServletContext sc=getServletContext();
	String url=sc.getInitParameter("url");
	String driver=sc.getInitParameter("driver");
	String password=sc.getInitParameter("password");
	String username=sc.getInitParameter("username");
	con = ConnectionManager.getConnection(); 
	
	
	System.out.println("Connection established");
	


		
	PreparedStatement insert_row=con.prepareStatement("INSERT INTO reg(fname,lname,emailid,userid,pass,dob,phone,address) VALUES(?,?,?,?,?,?,?,?)");
	
	insert_row.setString(1,fname);
	insert_row.setString(2,lname);
	insert_row.setString(3,emid);
	insert_row.setString(4,uid);
	insert_row.setString(5,pwd);
	insert_row.setString(6,dob);
	insert_row.setString(7,pno);
	insert_row.setString(8,address);
        System.out.println(insert_row);
	int insert=insert_row.executeUpdate();
	out.println("");
	out.println("");
	response.sendRedirect("reg.jsp?status=success");   
	//out.println("successfully inserted");
	}
}catch(Exception e)
{
	e.printStackTrace();
	}finally{
		if(con!=null)
		{
			con.close();
			System.out.println("Connection closed");
		}
	}


%>
           </body>
</html>