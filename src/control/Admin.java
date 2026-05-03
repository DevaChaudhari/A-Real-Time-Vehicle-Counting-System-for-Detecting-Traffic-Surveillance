package control;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class Admin
 */
@WebServlet("/Admin")
public class Admin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Admin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("in");
		String page = request.getParameter("page");
		String path ="";
		HttpSession session = request.getSession(true);
		if("adminlogin".equalsIgnoreCase(page)){
			String uid = request.getParameter("uid");
			String password = request.getParameter("password");
			System.out.println(uid + password);
			if("admin".equalsIgnoreCase(uid) && "admin".equals(password)){
				request.setAttribute("folderList", getFileList());
				path = "/Admin?page=file";
					
			}
			
			else{
				path = "/ServerLogin.jsp";
				request.setAttribute("user", "invalid");
			}
			session.setAttribute("usertype","admin");
		}else if("delete".equals(page)) {
			String servername = request.getParameter("server");
			String SRC_FOLDER = "D:\\Upload\\"+servername;
			delete(new File(SRC_FOLDER));
			request.setAttribute("folderList", getFileList());
			path = "/AdminHome.jsp";
			
		}else if("newserver".equals(page)) {
			String servername = request.getParameter("servername");
			new File("D:\\Upload\\"+servername).mkdir();
			request.setAttribute("folderList", getFileList());
			path = "/AdminHome.jsp";
			
		}
		else if("file".equals(page)) {
			
			request.setAttribute("folderList", getFileList());
			path = "/AdminHome.jsp";
			
		}
		
		
		RequestDispatcher rd = request.getRequestDispatcher(path);
		rd.forward(request, response);
	}
	 /*public ArrayList<String> getFileList() {
		// TODO Auto-generated method stub
		 ArrayList<String> folderList = new ArrayList<String>();
			File file = new File("D:\\Upload");
			String[] names = file.list();

			for(String name : names)
			{
			    if (new File("D:\\Upload\\" + name).isDirectory())
			    {
			    	folderList.add(name);
			    }
			}
			return folderList;
	
	}*/
	public ArrayList<FileBean> getFileList() {
		

		// TODO Auto-generated method stub
		ArrayList<FileBean> fb = new  ArrayList<FileBean>();
		DAO data=new DAO();
		Connection conn=data.getConnection();
		String validateUser = "select userid,time,filename from  file";
		PreparedStatement preparedStatement;
		try {
			preparedStatement = conn.prepareStatement(validateUser);
			
			// execute insert SQL statement
			ResultSet result=preparedStatement.executeQuery();
			while(result.next())
			{
				FileBean fb1 = new FileBean();
				fb1.setUsername(result.getString(1));
				fb1.setTime(result.getString(2));
				fb1.setFilename(result.getString(3));
				fb.add(fb1);
				
			}
			

		}
		
		
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
		// TODO Auto-generated method stub

		return fb;
	
		

	
	}

	public static void delete(File file)
		    	throws IOException{
		 
		    	if(file.isDirectory()){
		 
		    		//directory is empty, then delete it
		    		if(file.list().length==0){
		    			
		    		   file.delete();
		    		   System.out.println("Directory is deleted : " 
		                                                 + file.getAbsolutePath());
		    			
		    		}else{
		    			
		    		   //list all the directory contents
		        	   String files[] = file.list();
		     
		        	   for (String temp : files) {
		        	      //construct the file structure
		        	      File fileDelete = new File(file, temp);
		        		 
		        	      //recursive delete
		        	     delete(fileDelete);
		        	   }
		        		
		        	   //check the directory again, if empty then delete it
		        	   if(file.list().length==0){
		           	     file.delete();
		        	     System.out.println("Directory is deleted : " 
		                                                  + file.getAbsolutePath());
		        	   }
		    		}
		    		
		    	}else{
		    		//if file, then delete it
		    		file.delete();
		    		System.out.println("File is deleted : " + file.getAbsolutePath());
		    	}
		    }
		}

