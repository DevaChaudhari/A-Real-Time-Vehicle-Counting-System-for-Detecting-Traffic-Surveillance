package control;

import java.io.BufferedReader; 
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class StoreContent extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		 HttpSession session = request.getSession();
		
		String user_id = (String) session.getAttribute("username");
		
		int FileID = Integer.parseInt(request.getParameter("FileID"));
		String fileName = request.getParameter("fileName");
		
		String Block1 = request.getParameter("Block1");
		String Block2 = request.getParameter("Block2");
		String Block3 = request.getParameter("Block3");

		String firstBlock = request.getParameter("firstBlock");
		String middleBlock = request.getParameter("middleBlock");
		String lastBlock = request.getParameter("lastBlock");
		
		String b1 = request.getParameter("b1");
		String b2 = request.getParameter("b2");
		String b3 = request.getParameter("b3");
	
		
		
		GlobalFunction GF = new GlobalFunction();
		//ConnectionManager con = new ConnectionManager();
		Connection con = null;
		
		try {
			con = ConnectionManager.getConnection();
			Statement st = con.createStatement();
			
			
			for(int i=1;i<=3;i++){
				if(i==1){
					Statement stmt=con.createStatement();
					String qry = "SELECT * FROM blocked_files where diegest_key='"+b1+"'";
					
					
					
					ResultSet rst=stmt.executeQuery(qry);
                    if(rst.next())
                    {
                    	String query1 = "INSERT INTO debug_block (ref_fid,userid,blockid) VALUES('"+FileID+"','"+rst.getString("user_id")+"','"+rst.getString("id")+"')";
        				st.executeUpdate(query1);
                    	
                    	
                    }else{

                    	
                    	String query = "INSERT INTO blocked_files (fileName,fileID,block,blockData,diegest_key,user_id) VALUES ('"+fileName+"','"+FileID+"','"+Block1+"','"+firstBlock+"','"+b1+"','"+user_id+"')";
        				st.executeUpdate(query);
                    }
                    
                    File file = new File("D:\\upload\\server1\\"+FileID+".txt");
                    
                    if ( file.createNewFile() ) {
                   	FileWriter fw = new FileWriter(file.getAbsoluteFile());
                		BufferedWriter bw = new BufferedWriter(fw);
                		bw.write(firstBlock);
                		bw.close();
                     } else {
                        System.out.println("Failure!");
                     }
					
                    
                    
                   
            		
				
				}else if(i==2){
					
					Statement stmt=con.createStatement();
					String qry = "SELECT * FROM blocked_files where diegest_key='"+b2+"'";
					
					ResultSet rst=stmt.executeQuery(qry);
                    if(rst.next())
                    {
                    	String query1 = "INSERT INTO debug_block (ref_fid,userid,blockid) VALUES('"+FileID+"','"+rst.getString("user_id")+"','"+rst.getString("id")+"')";
        				st.executeUpdate(query1);
                    	
                    	
                    }else{
                    	
                    	String query = "INSERT INTO blocked_files (fileName,fileID,block,blockData,diegest_key,user_id) VALUES ('"+fileName+"','"+FileID+"','"+Block2+"','"+middleBlock+"','"+b2+"','"+user_id+"')";
    					st.executeUpdate(query);
                    }
					
					
                    File file = new File("D:\\upload\\server2\\"+FileID+".txt");
                    
                    if ( file.createNewFile() ) {
                    	FileWriter fw = new FileWriter(file.getAbsoluteFile());
                		BufferedWriter bw = new BufferedWriter(fw);
                		bw.write(middleBlock);
                		bw.close();
                     } else {
                        System.out.println("Failure!");
                     }
					
					
					
				}else if(i==3){
					
					Statement stmt=con.createStatement();
					String qry = "SELECT * FROM blocked_files where diegest_key='"+b3+"'";
					
					ResultSet rst=stmt.executeQuery(qry);
                    if(rst.next())
                    {
                    	String query1 = "INSERT INTO debug_block (ref_fid,userid,blockid) VALUES('"+FileID+"','"+rst.getString("user_id")+"','"+rst.getString("id")+"')";
        				st.executeUpdate(query1);
                    	
                    	
                    }else{
                    	
                    	
                    	
                    	String query = "INSERT INTO blocked_files (fileName,fileID,block,blockData,diegest_key,user_id) VALUES ('"+fileName+"','"+FileID+"','"+Block3+"','"+lastBlock+"','"+b3+"','"+user_id+"')";
    					st.executeUpdate(query);
                    }
					
                    File file = new File("D:\\upload\\server3\\"+FileID+".txt");
                    
                    if ( file.createNewFile() ) {
                    	FileWriter fw = new FileWriter(file.getAbsoluteFile());
                		BufferedWriter bw = new BufferedWriter(fw);
                		bw.write(lastBlock);
                		bw.close();
                     } else {
                        System.out.println("Failure!");
                     }
                    
					
					
				}
				
			
				
			}
			 
		
			//GF.DeleteFile();
		response.sendRedirect("UploadSuccess.jsp");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
