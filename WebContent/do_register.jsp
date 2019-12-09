<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Server to do the register page!</title>
</head>
<body>
<%
String Register_id=request.getParameter("register_id");
 String Register_name=request.getParameter("register_name");
 String Register_password=request.getParameter("register_password");
 String Register_question=request.getParameter("security_question");
 String Register_answer=request.getParameter("answer");
 if(Register_answer==null||"".equals(Register_answer.trim())||Register_question==null||"".equals(Register_question.trim())||Register_name==null||"".equals(Register_name.trim())||Register_password==null||"".equals(Register_password.trim())){ 
      System.out.println("text field can't be empty！");
      response.sendRedirect("register.jsp");//jump back
      return; 
      //request.getRequestDispatcher("login.jsp").forward(request, response); 
     } 

%>

<%
try{
 Class.forName("com.mysql.jdbc.Driver");//load mysql driver
 Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/test?useSSL=false", "root", "451236789");//connect to mySQL
 Statement stmt=conn.createStatement();
 PreparedStatement pStmt = conn.prepareStatement("select * from user where id = '" + Register_id + "'");  
 ResultSet rs = pStmt.executeQuery();  			
	if(rs.next()){  
      out.println("<script language='javascript'>alert('user exist, please change your id！');window.location.href='register.jsp';</script>");  
 		}
	else{
 		String InsertSQL="INSERT INTO user(id,username,password,securityquestion,answer) values('"+Register_id+"','"+Register_name+"','"+Register_password+"','"+Register_question+"','"+Register_answer+"')";
		 System.out.println(Register_name+"\t"+Register_password);//print out name and password
 		int FLAG=stmt.executeUpdate(InsertSQL);
	
 		if(FLAG!=0){//check state
 		    out.println("<script>alert('register successful！');history.go(-1);</script>"); 
 		}else{
   			  out.println("<script>alert('register failed！');history.go(-1);</script>");  
		 }
	}
 stmt.close();
 conn.close();

}catch(SQLException e){
e.printStackTrace(); 
}



%>

</body>
</html>