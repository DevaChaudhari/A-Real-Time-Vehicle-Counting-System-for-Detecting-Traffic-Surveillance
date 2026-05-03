<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%@page import="control.ConnectionManager" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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
            String user_id = null;
            if (session.getAttribute("username") != null) {
                user_id = (String) session.getAttribute("username");
                if(request.getParameter("Recover")!=null){
                    out.println("<script>alert('Block recovery request sent.!')</script>");
                    }
        %>
        
        <div class="main">
           
            <div class="clr"></div>
            <div class="header">
                <%@include file="header.jsp" %>
                <div class="clr"></div>
            </div>
            <div class="hbg"> <%@include file="image.jsp" %></div>
            <%@include file="WelcomeName.jsp" %>
            
            <div class="content">
                
                
                <div class="mainbar">
                    <div class="article" style="height:300px">


                        
                        <h2>All Files</h2>
                        <br></br>
                        <%


                            String uname = new String("");
                            String filename = new String("");
                            String f_attributes = new String("");
                            String f_policy = new String("");
                            Connection con = null;

                            ServletContext sc = getServletContext();
                            String url = sc.getInitParameter("url");
                            String driver = sc.getInitParameter("driver");
                            String password = sc.getInitParameter("password");
                            String username = sc.getInitParameter("username");

                            Class.forName(driver);
                            con = ConnectionManager.getConnection();
                            System.out.println("Connection established");

                            Statement stmt = con.createStatement();
                            ResultSet rs = stmt.executeQuery("select * from file");
                        %>
                        <table width="100%" style="border: 1px;width: 100%;text-align: center; border: 1px solid">   
                            <tr><th width="15%"  style="text-align: center; border: 1px solid">File Name</th>
                                <th width="15%"  style="text-align: center; border: 1px solid">Operation</th>
                                <th width="15%"  style="text-align: center; border: 1px solid">Action</th>
								
                            </tr>
                            <%
                                while (rs.next()) {
                                    int id = rs.getInt("id");
                                    uname = rs.getString("userid");
                                    filename = rs.getString("filename");
                            %>
                            <tr><td  style="text-align: center; border: 1px solid"><%=filename%>
                                </td>
                                
                                <td style="text-align: center; border: 1px solid"><a href="download_file.jsp?id=<%=id%>&file=<%=filename%>">Download File</a>&nbsp
                                <td style="text-align: center; border: 1px solid"><a href="Show_Blocks.jsp?id=<%=id%>&file=<%=filename%>">Show Blocks</a>&nbsp
                                </td>
                                
                                
                                <%  }%>
                            </tr>
                                  <%  Statement stmt1 = con.createStatement();
                                    ResultSet rs1 = stmt1.executeQuery("select * from dedup_data where userid='" + user_id + "'");
                                    while (rs1.next()) {
                                       int id = rs1.getInt("id");
                                       int ref_id= rs1.getInt("ref_ptr");
                                       String uname1 = rs1.getString("userid");
                                       String filename1 = rs1.getString("filename");
                                %>
                                <tr><td  style="text-align: center; border: 1px solid"><%=filename1%>
                                    </td>
                                    <td style="text-align: center; border: 1px solid"><a href="download_file.jsp?id=<%=ref_id%>&file=<%=filename1%>">Download File</a>&nbsp
                                    </td>

                                    <%  }

                                    %>        
                                </tr>
                        </table>
                        </center>       

                    </div>
                    <div class="article">
                        <!--        <h2><span>Lorem Ipsum</span> Dolor Sit</h2>
                                <div class="clr"></div>
                                <p class="post-data"><a href="#" class="com fr">Comments (7)</a> <span class="date">March 15, 2010</span> &nbsp;|&nbsp; Posted by <a href="#">Owner</a> &nbsp;|&nbsp; Filed under <a href="#">templates</a>, <a href="#">internet</a></p>
                                <img src="images/images_2.jpg" width="613" height="193" alt="" />
                                <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec libero. Suspendisse bibendum. Cras id urna. <a href="#">Morbi tincidunt, orci ac convallis aliquam, lectus turpis varius lorem, eu posuere nunc justo tempus leo.</a> Donec mattis, purus nec placerat bibendum, dui pede condimentum odio, ac blandit ante orci ut diam. Cras fringilla magna. Phasellus suscipit, leo a pharetra condimentum, lorem tellus eleifend magna, eget fringilla velit magna id neque. Curabitur vel urna. In tristique orci porttitor ipsum. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec libero. Suspendisse bibendum. Cras id urna. Morbi tincidunt, orci ac convallis aliquam.</p>
                                <p>Aenean commodo elit ac ante dignissim iaculis sit amet non velit. Donec magna sapien, molestie sit amet faucibus sit amet, fringilla in urna. Aliquam erat volutpat. Fusce a dui est. Sed in volutpat elit. Nam odio tortor, pulvinar non scelerisque in, eleifend nec nunc. Sed pretium, massa sed dictum dapibus, nibh purus posuere magna, ac porta felis lectus ut neque. Nullam sagittis ante vitae velit facilisis lacinia. Cras vehicula lacinia ornare. Duis et cursus risus. Curabitur consectetur justo sit amet odio viverra vel iaculis odio gravida. Ut imperdiet metus nec erat.</p>
                                <p class="spec"><a href="#" class="rm fl">Read more</a></p>
                                <div class="clr"></div>-->
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
        
        <%
            } else {
                response.sendRedirect("index.jsp");
            }
        %>
    </body>
</html>