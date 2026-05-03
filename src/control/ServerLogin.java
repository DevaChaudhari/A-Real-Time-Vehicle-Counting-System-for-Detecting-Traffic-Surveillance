/** Designed and developed by Swapnil Kumawat
 * 
 */
package control;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class ServerLogin extends HttpServlet{

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse responce) throws ServletException, IOException {
       
        HttpSession session = request.getSession();
        try {
            GlobalFunction GF = new GlobalFunction();
            String user=request.getParameter("uid");
            String password=request.getParameter("pwd");
          //  String UserRoleText=request.getParameter("UserRole");
            
            Connection con = ConnectionManager.getConnection();
        
            Statement st = null;
            
           
          
           st = con.createStatement();
            
            if(user.equalsIgnoreCase("server1"))
            {  
                   session.setAttribute("Userid", 1);
                   session.setAttribute("usertype", "server");
                   session.setAttribute("username", "server1");
                   responce.sendRedirect("ServerHome.jsp");        
                
              }else if(user.equalsIgnoreCase("server2")){
            	  session.setAttribute("Userid", 2);  
            	  session.setAttribute("usertype", "server");
            	  session.setAttribute("username", "server2");            	  
                  responce.sendRedirect("ServerHome.jsp");
              }else if(user.equalsIgnoreCase("server3")){
            	  session.setAttribute("Userid", 3); 
            	  session.setAttribute("usertype", "server");
            	  session.setAttribute("username", "server3");
                  responce.sendRedirect("ServerHome.jsp");
              }else if(user.equalsIgnoreCase("admin")){
            	  session.setAttribute("Userid", 3); 
            	  session.setAttribute("usertype", "admin");
            	  session.setAttribute("username", "admin");
                  responce.sendRedirect("AdminHome.jsp");
              }else{                
                
            	  responce.sendRedirect("ServerLogin.jsp?loginfail='LoginFail'");
            }
        } catch (Exception e) { e.getMessage();
        }
        
    }
     
}