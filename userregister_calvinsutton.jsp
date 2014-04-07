<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>User Register</title>
	</head>
	<body>
		<h1>User registration</h1>
		<table>
			<tr><td><label for ="un">Username:</label></td>
			<td><input type="text" name="un" id ="un"/><br></td></tr>
			
			<tr><td><label for ="email">Email:</label></td>
			<td><input type="text" name="email" id = "email"/><br></td></tr>
			
			<tr><td><label for ="reemail">Re enter email:</label></td>
			<td><input type="text" name="reemail" id = "reemail"/><br></td></tr>
			
			<tr><td><label for ="pw">Password:</label></td>
			<td><input type="text" name="pw" id = "pw"/><br></td></tr>
		</table>
		<input type="checkbox" name = "agree">Agree to user rules and regulations. Click here for rules.<br>
		<input type="submit" value = "Register">
		<input type="submit" value= "Cancel">
	</body>
</html>