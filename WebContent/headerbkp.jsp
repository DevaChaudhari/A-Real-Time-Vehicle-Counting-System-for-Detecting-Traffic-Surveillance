<div class="logo">
                    <h1>Deduplication System</h1>
                </div>
                <div class="menu_nav">
                    <%
                    if(session.getAttribute("usertype").toString().equalsIgnoreCase("user")){
                    	
                    %>
                    <ul>
                        <li><a href="Homepage.jsp">Home</a></li>
                        <li><a href="Upload.jsp">Upload File</a></li>
                       <!-- <li><a href="ViewGraph1.jsp">Graph1</a></li>
                       <li><a href="ViewGraph2.jsp">Graph2</a></li> -->
                        <li><a href="download.jsp">Download File</a></li>
                        <li><a href="logout.jsp">Logout</a></li>
                    </ul>
                    <%
                    }else if(session.getAttribute("usertype").toString().equalsIgnoreCase("server")){
                    	 %>
                         <ul>
                             <li><a href="ServerHome.jsp">Home</a></li>                            
                             <li><a href="ServerBlock.jsp">Blocks</a></li>
                              
                             <li><a href="logout.jsp">Logout</a></li>
                         </ul>
                         <%
                    }else if(session.getAttribute("usertype").toString().equalsIgnoreCase("admin")){
                   	 %>
                     <ul>
                         <li><a href="AdminHome.jsp">Home</a></li>
                        
                         <li><a href="AllFiles.jsp">Files</a></li>
                          <li><a href="DuplicateFiles.jsp">Duplicate Files</a></li>
                         <li><a href="logout.jsp">Logout</a></li>
                     </ul>
                     <%
                }
                    %>
                    <div class="clr"></div>
                </div>