<%@ page import="java.sql.*" %> 
<html> 
    <head> 
        <title>Simple JSP Application</title> 
    </head> 
    <body bgcolor="white"> 
<table align=center width="800"> 
 <tr align=center bgcolor="pink" border=1> 
<th>ID</th> 
<th>USERNAME</th> 
<th>REASON</th>  
 
</tr> 
<% 
 
Class.forName("com.mysql.jdbc.Driver");
System.out.println("Driver Classes Loaded");  
Connection con = null;
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/world", "root", "root");  
System.out.println("Connection Established"); 
 PreparedStatement pstmt = con.prepareStatement("select * from request"); ResultSet rs = pstmt.executeQuery();  while(rs.next()) { 
 	%> 
 	<tr align=center> 
 	<td><%=rs.getString("id")%></td> 
 	<td><%=rs.getString("username")%></td> 
 	<td><%=rs.getString("reason")%></td> 
 	 
 	</tr> 
 	<% 
} 
 
%> 
 
 
 
 
</table> 
</table> 
<form method="post" action="checkmanager_res.jsp"> 
<table align="center"> 
<tr> 
<td>Enter ID</td> 
<td><input type="text" name="id"></td> 
</tr> 
<tr> 
<td>Enter Username</td> 
<td><input type="text" name="uname"></td> 
</tr> 
<tr> 
<td><a href="acceptreq.jsp"><input type="submit" name="button" value="Accept"></a></td> 
<td><a href="rejectreq.jsp"><input type="submit" name="button" value="Reject"></a></td> 
</tr> 
</table> 
</form> 
 
 
    </body> </html> 
