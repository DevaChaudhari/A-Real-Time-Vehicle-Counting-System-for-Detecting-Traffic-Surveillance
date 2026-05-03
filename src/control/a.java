/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
/*import java.util.Arrays;*/
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;


public class a extends HttpServlet {

    public static int startid;
    public static String ses1;
    public static String ses2;
    public static String servername;
    public static String saveFile1;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse responce) throws ServletException, IOException {
    		System.out.println("asas");
        String user_id = "";
        String servername = request.getParameter("servername");
        HttpSession session = request.getSession();
        PrintWriter out = responce.getWriter();
        if (session.getAttribute("username") != null) {
            user_id = (String) session.getAttribute("username");
            out.println("user_id" + user_id);
            RequestDispatcher rd = null;
            GlobalFunction GF=new GlobalFunction();
            
            String id = "";
            String user = "";
            int count1 = 0, count2 = 0, count3 = 0, count4 = 0, count5 = 0;

            boolean isMultipart = ServletFileUpload.isMultipartContent(request);
            out.println("isMultipart" + isMultipart);
            if (!isMultipart) {
            } else {
                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);
                List items = null;
                try {
                    items = upload.parseRequest(request);
                    out.println("items" + items);
                } catch (FileUploadException e) {
                    e.printStackTrace();
                }

                try {

                	 long startUT = 0, endtimeUT = 0;
                     long elapsedTimeMillisUT = 0;
                     float elapsedTimeSecUT = 0;
                     
                     long startET = 0, endtimeET = 0;
                     long elapsedTimeMillisET = 0;
                     float elapsedTimeSecET = 0;
                     
                     
                     
                    Iterator itr = items.iterator();
                    while (itr.hasNext()) {
                        FileItem item = (FileItem) itr.next();
                        if (item.isFormField()) {
                            String namee = item.getFieldName();
                            String value = item.getString();
                            if (namee.equals("user")) {
                                out.println("user" + user);
                                user = value;
                                count1 = 1;
                            }
                        } else {

                        	/*Below code is usedto savethe file on the server default path*/
                        	
                        	startUT=System.currentTimeMillis();
                            String itemName = item.getName();
                            float fsize = item.getSize();
                            float Fsize = fsize / 60;
                             elapsedTimeSecUT = Fsize / 1000F;
                            //System.out.println("---file speed---" + fUSpeed);
                             String filepath= request.getParameter("path");
                             System.out.println(filepath);
							File savedFile = new File("D:\\upload\\" +servername+"\\"+itemName);//config.getServletContext().getRealPath("/")+"emp_image\\image\\"+itemName);
                            
                           
                            item.write(savedFile);
                            endtimeUT = System.currentTimeMillis();
                            
                            elapsedTimeMillisUT = endtimeUT - startUT;
                            //elapsedTimeSecUT = elapsedTimeMillisUT / 1000F;
                            System.out.println("Upload Time--------"+elapsedTimeSecUT);

                            String ext = FilenameUtils.getExtension(itemName);
                            
                           
                            System.out.println("fname"+ext);
                          
                            String str=itemName;
                            String file_witout_ext ="";
                            
                                str = str.substring(0, str.lastIndexOf("."));
                                // Because extension is always after the last '.'
                                file_witout_ext=str;
                                System.out.println("File Name=" + str);
                            

                             System.out.println("file_witout_ext" + file_witout_ext);
                            
/*This code is used to duplicate the file with Plain_ as a prefix*/
                            
                            String fname = savedFile.getName();
                            
                            String dest ="D:\\upload\\Plain_"+itemName;
                            
                            String source = "D:\\upload\\" +servername+"\\"+itemName;
                            
                            File fin = new File(source);
                            FileInputStream fis1 = new FileInputStream(fin);
                			BufferedReader in = new BufferedReader(new InputStreamReader(fis1));
                            FileWriter fstream = new FileWriter(dest, true);
                            BufferedWriter outt = new BufferedWriter(fstream);
                           
                            String aLine = null;
                			while ((aLine = in.readLine()) != null) {
                				//Process each line and add output to Dest.txt file
                				outt.write(aLine);
                				outt.newLine();
                			}
                            
                            outt.close();
                            in.close();
                            fstream.close();
                            fis1.close();
                            
                            
                			FileReader file = new FileReader("D:\\upload\\" +servername+"\\"+itemName);

                            String path = "D:\\upload\\" +servername+"\\"+itemName;
                            BufferedReader reader = new BufferedReader(file);
                            String text = "";
                            String line = reader.readLine();
                            while (line != null) {
                                text += line;
                                line = reader.readLine();
                                
                               
                                
                              //  out.println("line");
                            }
                            reader.close();
                            
                            System.out.println(text);

                            FileUtil fu = new FileUtil();
                            byte[] b1 = fu.createChecksum(path, "MD5");
                            System.out.println("b1 lenght" + b1.length);
                            System.out.println("b length" + b1.length);
                            System.out.println("b::" + b1);

                            String instr = new String(b1, "UTF-8").trim();
                            System.out.println("main instr::" + instr);

                            byte[] bg = instr.getBytes();
                            System.out.println("bg length" + bg.length);
                            System.out.println("bg::" + bg);
                            char[] org_bg=instr.toCharArray();
                            
                             Connection con = null;
                            try {
                             
                                con = ConnectionManager.getConnection();
                                System.out.println("Connection established");
                            
                                
                                Blob hash_data;
                                
                                int flag=0;
                            /////////////////check deduplication
                            
                            Statement stmt =con.createStatement();
                            String chck_sql="select * from file";
                            ResultSet rst=stmt.executeQuery(chck_sql);
                            while(rst.next())
                            {
                                int ref_id=rst.getInt("id");
                                hash_data=rst.getBlob("secrete_key");
                                
                              byte[] db_enc_data = hash_data.getBytes(1,(int)hash_data.length());
                              System.out.println("db_enc_data"+db_enc_data);
                              
                              String instr1 = new String(db_enc_data, "UTF-8").trim();
                              System.out.println("instr::" + instr1);
                              System.out.println(instr+" == "+instr1);
                              
//                              
                              char[] db_bg= instr1.toCharArray();
                            /* if(Arrays.equals(org_bg, db_bg))
                              {
                                 */ System.out.println("in if");
                                  
                                  AESFile ae = new AESFile();

                                  ae.generateKey(b1, "AES");

                                  //startET=System.currentTimeMillis();
                                  String plainText = text;
                                  String encryptedText = AESFile.encrypt(plainText);

                                  //endtimeET = System.currentTimeMillis();
                                  
                                  //elapsedTimeMillisET = endtimeET - startET;
                                  //elapsedTimeSecET = elapsedTimeMillisET / 1000F;
                                  //System.out.println("Encryption Time-------"+elapsedTimeSecET);
                                  
                                  
                                  String enc_file = "D:\\upload\\" +servername+"\\"+file_witout_ext+"."+ext;
                                 
//                                  if ( ffile.createNewFile() ) {
//                                  FileWriter writer1 = new FileWriter(ffile.getAbsoluteFile());
//                                  BufferedWriter bw = new BufferedWriter(writer1);
//                                  bw.write(plainText);
//                                  bw.close();
//                                  }
                                  
                                  
                                  PrintWriter writer = new PrintWriter(enc_file, "UTF-8");
                                  writer.println(encryptedText);
                                  writer.close();

                                  
                                  
                                  Statement dedup_stmt=con.createStatement();
                                  String query="insert into dedup_data(ref_ptr,userid,filename) values("+ref_id+",'"+user_id+"','"+fname+"')";
                                  int inst=dedup_stmt.executeUpdate(query);
                                  flag=1;
                                  //responce.sendRedirect("Upload.jsp?status=success");
                                  
                                  session.setAttribute("fileName", fname);
                                  responce.sendRedirect("Split_File.jsp?duplicate=duplicate");
                              /*}*/
                              
                            }    
                            
                            
                            
                            if(flag==0)
                            {
                            	session.setAttribute("fileName", fname);
                                System.out.println("in else");
                            ///////////////////////////////////
                            AESFile ae = new AESFile();

                            ae.generateKey(b1, "AES");

                            startET=System.currentTimeMillis();
                            String plainText = text;
                            String encryptedText = AESFile.encrypt(plainText);
                         
                            endtimeET = System.currentTimeMillis();
                            
                            elapsedTimeMillisET = endtimeET - startET;
                            elapsedTimeSecET = elapsedTimeMillisET / 1000F;
                            System.out.println("Encryption Time-------"+elapsedTimeSecET);
                            String enc_file = "D:\\upload\\" +servername+"\\"+file_witout_ext+"."+ext;
                            

                            PrintWriter writer = new PrintWriter(enc_file, "UTF-8");
                            writer.println(encryptedText);
                            writer.close();


                           

                                Statement st = null;
                              

                                File save_enc_file = new File(enc_file);


                                PreparedStatement psmt = null;

                                psmt = con.prepareStatement("insert into file(userid,filename,secrete_key,file)" + "values(?,?,?,?)");
                               

                                psmt.setString(1, user_id);
                                psmt.setString(2, fname);
                                psmt.setBytes(3, b1);
                                FileInputStream fis = new FileInputStream(save_enc_file);
                                psmt.setBinaryStream(4, (InputStream) fis, (int) (save_enc_file.length()));

                                
                                int s = psmt.executeUpdate();
                                if(s>0){
                                	int lfid = GF.getLatestFileID();
                                	
                                	//GF.setGraphTime(lfid, elapsedTimeSecUT, elapsedTimeSecET,user_id);
                                	
                                }

                                st = con.createStatement();
                                //session.setAttribute("fileName", fname);
                                responce.sendRedirect("Split_File.jsp");
                             }  
                            } catch (Exception e) {
                            }
                        }
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    System.out.println(e.getMessage());
                }
            }
        }
// rd.forward(request, responce);
    }
}