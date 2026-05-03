
    <%@page import="java.io.File"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="control.DAO"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="control.ConnectionManager" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<link rel="stylesheet" href="css/table.css" type="text/css" media="all">
    <head>
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
        <%
        
        if(request.getParameter("Recover")!=null){
            out.println("<script>alert('Block recovery request sent.!')</script>");
            }
            
            String user_id = null;
            if (session.getAttribute("username") != null) {
                user_id = (String) session.getAttribute("username");

        %>
        
    
                <%@include file="header.jsp" %>
<div class="wrap">
<div class="col span_2_of_3">
				  <div class="contact-form">
    

                        
                        <h2>Choose File TO Download</h2>
                        <br></br>
                        <%
                        String filename ="";
       				 session = request.getSession(true);
       				File folder = new File("C:\\");
       				if(folder != null){
       				File[] listOfFiles = folder.listFiles();
       				                         %>
      <table   class="tbl1 scroll" border="1"  cellspacing="0" > <!-- cellspacing='0' is important, must stay -->   
                            <thead><th width="15%"  style="text-align: center; border: 1px solid">File Name</th>
                              <th width="15%"  style="text-align: center; border: 1px solid">Operation</th>
                         
                            </thead>
                            <%
                            for (int i = 0; listOfFiles !=null && i < listOfFiles.length; i++) {
             				      if (listOfFiles[i].isFile()) {
             				    	  System.out.println(listOfFiles[i].getName());
             				    	 filename = listOfFiles[i].getName();
             				     
                                      
                            %>
                            <form action="download_file.jsp">
                            <tr><td  style="text-align: center; border: 1px solid"><%=filename%> <input type="hidden" name="file" value="<%=filename%>">
                             
                          
                           
                                </td>
                              
                                  <td style="text-align: center; border: 1px solid"><input type="submit" name="event" value="Submit">
                               
                                </td>
                               
                                </tr>
                                </form>
                                
                                <%     
             				      } 
             				    }
             				}%>
                                         	
                                
                            </thead>
           
                     </table>
					</article>
			</div>
		</div>
	</section>
	<div class="clear"></div>
</div>
           <%@include file="footer.jsp"%>
        
        <%
            } else {
                response.sendRedirect("index.jsp");
            }
        %>
    </body>
</html>                                                 	