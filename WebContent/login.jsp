<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User Login Page</title>



</head>
<body>
<hr><br>Welcome to this <font color="green">Login Page</font>!<br>
<form action="do_login.jsp" method="post">
<br>
<h1>Please input your message:</h1><br>
User id:<input type="text" name="id"><br>
<br>
Password:  <input type="password" name="password"><br>
<br><br><br>
<input type="submit" value="login">   
Click me to <font color="green"><a href="register.jsp">Register</a>!</font><br>
<font color="green"><a href="forgetpassword.jsp">Forget Password</a></font><br>
</form>

</body>
</html>