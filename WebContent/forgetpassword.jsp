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

<form action="set_password.jsp" method="post">
<br>
<h1>Please input your message:</h1><br>
User id:<input type="text" name="forget_password_id"><br>


<br><br><br>
<input type="submit" value="Submit">   

</form>

</body>
</html>