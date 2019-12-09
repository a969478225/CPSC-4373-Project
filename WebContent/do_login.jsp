<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Server to do the  page!</title>
</head>
<body>
<%

 String id=request.getParameter("id");
 String password=request.getParameter("password");

 if(id==null||"".equals(id.trim())||password==null||"".equals(password.trim())){ 
      System.out.println("text field can't be empty！");
      response.sendRedirect("login.jsp");//jump back
      return; 
      //request.getRequestDispatcher("login.jsp").forward(request, response); 
     } 

%>

<%
try{
 Class.forName("com.mysql.jdbc.Driver");//load mysql driver
 Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/test?useSSL=false", "root", "451236789");//connect to mySQL
 if(conn!=null){
		
		String sql="select * from user where id='"+id+"' and password='"+ password + "'";
		out.println("sql="+sql);
		Statement stmt=conn.createStatement();
		ResultSet rs=stmt.executeQuery(sql);
		if(rs.next()){
			out.println("<script language='javascript'>alert('login successful！')；</script>");
			response.sendRedirect("home.jsp");
			//window.location.href='Home.jsp';
		}
		else{
			 out.println("<script language='javascript'>alert('login failed！');window.location.href='login.jsp';</script>");
			 //response.sendRedirect("Login.jsp");//
		}
		stmt.close();
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