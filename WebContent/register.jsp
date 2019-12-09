<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>register page</title>
</head>
<body>
<hr><br>Welcome to this <font color="green">Register Page</font>!<br>
<form action="do_register.jsp" method="post">
<br>
<h1>Please input your message:</h1><br>
User ID(number only):<input type="text" name="register_id"><br>
<br>
User name:<input type="text" name="register_name"><br>
<br>
Password:<input type="password" name="register_password"><br>
<br>
Set a security question:<input type="text" name="security_question"><br>
<br>
Answer:<input type="text" name="answer"><br>
<br><br><br>
<input type="submit" value="register">
</form>
</body>
</html>