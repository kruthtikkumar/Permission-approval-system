<%@ page import="java.sql.*" %> 
<% 
try{ 
	Class.forName("com.mysql.jdbc.Driver");
	System.out.println("Driver Classes Loaded");  
	Connection con = null;
	
	int id = Integer.parseInt(request.getParameter("id"));  
	String  uname = request.getParameter("uname"); 
	String button = request.getParameter("button");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/world", "root", "root");  
 	 
 	PreparedStatement pstmt = con.prepareStatement("update request set status_1=? where username=? and id=?"); 
 	pstmt.setString(1,button);
 	pstmt.setString(2,uname);
 	pstmt.setInt(3,id);
 	int n = pstmt.executeUpdate();
 	if(n>0){ 
 	 	%><h4>Updated 
 	 	<a href="home.html">Home</a></h4><% 
 	} 
 	else{ 
	 	%><h4>Not Updated or Invalid Credentials</h4><% 
} } catch(Exception e) 
{ 
 	out.println(e); 
} 
%> 
