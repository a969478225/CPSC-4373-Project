<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Password Reset Page</title>



</head>





<body>

<%
 String question="";
 String id=request.getParameter("forget_password_id");
 
 Class.forName("com.mysql.jdbc.Driver");//load mysql driver
 Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/test?useSSL=false", "root", "451236789");//connect to mySQL
 if(conn!=null){
		String sql="select * from user where id='"+id+"'";
		Statement stmt=conn.createStatement();
		ResultSet rs=stmt.executeQuery(sql);
		if(rs.next()){
			question=rs.getString("securityquestion");
			
		}
 }
 
%>


<form action="do_set_password.jsp" method="post">
<br>
<input type="hidden" name="forget_password_id" value="<%= id %>">
<h2><%= question %></h2><br>
<br>
Answer: <input type="text" name="reset_answer"><br>
<br>
New Password: <input type="password" name="new_password"><br>
<br><br><br>
<input type="submit" value="Submit">   

</form>

</body>
</html>