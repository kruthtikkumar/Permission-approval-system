<%@ page import="java.sql.*" %> 
<% 
Class.forName("com.mysql.jdbc.Driver");
System.out.println("Driver Classes Loaded");  
Connection con = null;
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/world", "root", "root");  
System.out.println("Connection Established");
String uname = (String) session.getAttribute("emp_uname"); 
PreparedStatement pstmt = con.prepareStatement("delete from request where username=?"); pstmt.setString(1, uname); int n=pstmt.executeUpdate(); if(n>0) 
{ 
 	%><a href = "viewrequest_leader.jsp">back to leader view page</a> <% 
} 
%> 
