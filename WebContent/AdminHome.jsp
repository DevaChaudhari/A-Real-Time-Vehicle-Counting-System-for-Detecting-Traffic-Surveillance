<%@page import="control.FileBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="control.GlobalFunction"%>

<%@page import="control.ConnectionManager" %>
<html xmlns="http://www.w3.org/1999/xhtml">

<%ArrayList<FileBean> folderList = (ArrayList<FileBean>) request.getAttribute("folderList"); %>
    <head>
      <link rel="stylesheet" href="css/table.css" type="text/css" media="all">
<title></title>
</head>
<body>

                <%@include file="header.jsp" %>
<div class="wrap">
<div class="col span_2_of_3">
				  <div class="contact-form">
<form action="Admin" method="post">
<br>

</form>

	<table   class="tbl1 scroll" border="1"  cellspacing="0" > <!-- cellspacing='0' is important, must stay -->

	<!-- Table Header -->
	<thead>
		<tr>
					<th>Sr no</th>
			<th>File Name</th>
			<th>Action</th>
			<th>User Name</th>
			<th>Time</th>
			
		</tr>
	</thead>
	<!-- Table Header -->

	<!-- Table Body -->
<%for(int i=0;folderList!=null && i< folderList.size();i++){ %>
		<tr>
		<td><%=i+1 %></td>
			<td><%=folderList.get(i).getFilename() %></a></td>
			<td><a href="<%=request.getContextPath()%>/Admin?page=download">Download</a></td>
			<td><%=folderList.get(i).getUsername() %></a></td>
			<td><%=folderList.get(i).getTime() %></a></td>
			
			
		</tr><!-- Table Row -->

	<%} %>

	<!-- Table Body -->

</table>
					</article>
			</div>
		</div>
	</section>
	<div class="clear"></div>
</div>
	     <%@include file="footer.jsp"%>

 
    </body>
</html>