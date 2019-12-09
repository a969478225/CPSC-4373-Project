<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<%

 String id=request.getParameter("forget_password_id");
 String new_password=request.getParameter("new_password");
 String answer=request.getParameter("reset_answer");
 
 
 if(new_password==null||"".equals(new_password.trim())||answer==null||"".equals(answer.trim())){ 
      System.out.println("text field can't be empty！");
      response.sendRedirect("set_password.jsp");//jump back
      return; 
     } 

%>

<%
try{
System.out.println(new_password);
 Class.forName("com.mysql.jdbc.Driver");//load mysql driver
 Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/test?useSSL=false", "root", "451236789");//connect to mySQL
 if(conn!=null){
		String sql="select * from user where id='"+id+"' and answer='"+ answer + "'";
		Statement stmt=conn.createStatement();
		ResultSet rs=stmt.executeQuery(sql);
		if(rs.next()){
			String s="Update user set password=? where id='"+id+"'";
			stmt.close();
			PreparedStatement ps = conn.prepareStatement(s);
			ps.setString(1,new_password);
			ps.executeUpdate();
			out.println("<script language='javascript'>alert('change successful！')；</script>");
			response.sendRedirect("login.jsp");
		}
		else{
		
			out.println("<script language='javascript'>alert('failed！');window.location.href='login.jsp';</script>");
		
		}
		
		
		
		
	}
	else{
		out.println("<script language='javascript'>alert('can't connect to database！');</script>");
		response.sendRedirect("login.jsp");//
		
	}
 
 conn.close();

}catch(SQLException e){
e.printStackTrace(); 
}



%>

</body>
</html>