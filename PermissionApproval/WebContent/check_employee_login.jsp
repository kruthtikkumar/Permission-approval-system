<%@ page import="java.sql.*" %> 
<% 
 
String username = request.getParameter("uname"); 
String password = request.getParameter("pwd"); 
try 
{ 
	Class.forName("com.mysql.jdbc.Driver");
	System.out.println("Driver Classes Loaded");  
	Connection con = null;
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/world", "root", "root");  
	
 	  PreparedStatement pstmt = con.prepareStatement("select * from employee where username=? and password=?"); 	  
 	  pstmt.setString(1,username);  	 
 	  pstmt.setString(2,password);  	  
 	  ResultSet rs = pstmt.executeQuery();  	
 	  if(rs.next()) 
 	  { 
 	 	 session.setAttribute("uname", username); 
 	 	  
 	 	 session.setAttribute("pwd", password); 
 	 	 out.println("WELCOME "+username); 
                %><br> 
 	<a href="req.html">CLICK TO REQUEST</a><br> 
        <a href="prevreq.jsp">PREVIOUS REQUEST</a> 
 	 	 	<%  
                 
                 
 	   
          } 
           
 	  else 
 	  { 
 	 	  %> 
 	 	 	<h3>LOGIN FAILED</h3><br> 
 
 	 	 	<%  
 	  } 
} 
catch(Exception e) 
{ 
 	out.println(e); 
} 
%> 
