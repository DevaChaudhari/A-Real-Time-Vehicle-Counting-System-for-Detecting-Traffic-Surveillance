/*******************************************************************************
 * Copyright (c) 2016  Swapnil Kumawat.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms.
 * Contributors:
 *     Webminds Technology
 *******************************************************************************/
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



public class RespondAdmin extends HttpServlet {
    HttpSession session=null;

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
                session = request.getSession(true);

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
                 execute(request,response);

    }

 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
                 execute(request,response);

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
   
    
    public void execute(HttpServletRequest request,HttpServletResponse response)
    {
        try
        {
        	ConnectionManager cm = new ConnectionManager();
        	Statement st1 = cm.statement();
           
            int tblID = Integer.parseInt(request.getParameter("id"));
            int fileID = Integer.parseInt(request.getParameter("fileID"));
            String BlockName = request.getParameter("BlockName");
            String everything = "";
            
            
           if(BlockName.equalsIgnoreCase("Block1")){
        	   
		        	    StringBuilder SB = new StringBuilder();
		           	
			           	BufferedReader br = new BufferedReader(new FileReader("D:\\upload\\server1\\"+fileID+".txt"));
			           	try{
			           		
			           		String line = br.readLine();
			           		while(line!=null){
			           			SB.append(line);
			           			SB.append("\n");
			           			line=br.readLine();           			
			           		}
			           	}catch(Exception e){
			           		System.out.println(e);
			           	}
			           	everything = SB.toString();
        	   
        	   
        	   
        	   
           }else if(BlockName.equalsIgnoreCase("Block2")){
        	   
        	   StringBuilder SB = new StringBuilder();
	           	
	           	BufferedReader br = new BufferedReader(new FileReader("D:\\upload\\server2\\"+fileID+".txt"));
	           	try{
	           		
	           		String line = br.readLine();
	           		while(line!=null){
	           			SB.append(line);
	           			SB.append("\n");
	           			line=br.readLine();           			
	           		}
	           	}catch(Exception e){
	           		System.out.println(e);
	           	}
	           	everything = SB.toString();
        	   
        	   
        	   
        	   
        	   
           }else if(BlockName.equalsIgnoreCase("Block3")){
        	   
        	   
        	   StringBuilder SB = new StringBuilder();
	           	
	           	BufferedReader br = new BufferedReader(new FileReader("D:\\upload\\server3\\"+fileID+".txt"));
	           	try{
	           		
	           		String line = br.readLine();
	           		while(line!=null){
	           			SB.append(line);
	           			SB.append("\n");
	           			line=br.readLine();           			
	           		}
	           	}catch(Exception e){
	           		System.out.println(e);
	           	}
	           	everything = SB.toString();
        	   
        	   
           }
            
           
 
            
            
            Statement st = cm.statement();
            Statement st0 = cm.statement();
            String query = "update blockrecover set Status='1',BlockData='"+everything+"' where id="+tblID;
            int r = st.executeUpdate(query);
            if(r>0)
            {
                
            	st0.executeUpdate("update blocked_files set blockData='"+everything+"' where fileID="+fileID+" and block='"+BlockName+"'");
                response.sendRedirect("BlockRequests.jsp");                           
            }

            
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
    }
    
}
