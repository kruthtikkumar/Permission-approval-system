<%@ page import="java.sql.*" %> 
 
<% 
String fname = request.getParameter("fname"); 
String gender = request.getParameter("gender"); 
String uname = request.getParameter("uname"); 
String pwd = request.getParameter("pwd"); 
String mobile = request.getParameter("mobile"); 
String email = request.getParameter("email"); 
 
int id = (int)(Math.random() * 10 + 1); 
 
try 
{ 
	Class.forName("com.mysql.jdbc.Driver");
	System.out.println("Driver Classes Loaded");  
	Connection con = null;
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/world", "root", "root");  
	System.out.println("Connection Established");
 	 PreparedStatement ps = con.prepareStatement("select * from employee where username=? or email=? or mobile=?");
 	 ps.setString(1, uname);
 	 ps.setString(2, email);
 	 ps.setString(3, mobile); 
 	  
 	 ResultSet rs = ps.executeQuery(); 
 	  
 	 if(rs.next()) 
 	 { 
 	 	 %> 
 	 	 	<h3>Email Id / Username / Mobileno already available</h3><br> 
 	<a href="reg.html">Try Again</a> 
 	 	 	<%   
 	 } 
 	 else 
 	 { 
 	 	 String status_1=null; 
 	 	 String status_2=null; 
 	 	 String status_3=null; 
 	 	 PreparedStatement pstmt = con.prepareStatement("insert into employee values(?,?,?,?,?,?,?)"); 
 	 	  
 	 	 pstmt.setInt(1, id);  	 
 	 	 pstmt.setString(2, uname);  
 	 	 pstmt.setString(3, pwd);  
 	 	 pstmt.setString(4, email);  	 	 
 	 	 pstmt.setString(5, fname);
 	 	 pstmt.setString(6, gender);  
 	 	 pstmt.setString(7, mobile);  	 	
 	 	
 	 	 int i = pstmt.executeUpdate(); 
	 	  
 	 	 if(i>0) 
 	 	 { 
 	 	 	%> 
 	 	 	<h3>User Registration Successful</h3><br> 
 	 	 	<a href="employee_login.html">GO to Login page</a> 
 	 
 	 	 	<%   	 	 } 
 	 	 else 
 	 	 { 
 	 	 	 	%> 
 	 	 	 	<h3>User Registration UnSuccessful</h3><br> 
 	 	<a href="index.html">Try to Register Again</a> 
 	 	 	 	<%  
 	 	 } 
 	 	 
 	 } 
 	  
 	  
 	  
 	  
} catch(Exception e) 
{ 
 	out.println(e); 
} 
 
%> 

 	