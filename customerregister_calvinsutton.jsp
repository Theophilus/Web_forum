<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Customer Register</title>
	</head>
	<body>
		<h1>Customer Registration</h1>
		<table>
			<tr><td><label for ="un">Username:</label></td>
			<td><input type="text" name="un" id ="un"/><br></td></tr>
			
			<tr><td><label for ="email">Email:</label></td>
			<td><input type="text" name="email" id = "email"/><br></td></tr>
			
			<tr><td><label for ="fn">First name:</label></td>
			<td><input type="text" name="fn" id = "fn"/><br></td></tr>
			
			<tr><td><label for ="ln">Last name:</label></td>
			<td><input type="text" name="ln" id = "ln"/><br></td></tr>
			
			<tr><td><label for ="cmpy">Company:</label></td>
			<td><input type="text" name="cmpy" id ="cmpy"/><br></td></tr>
			
			<tr><td><label for ="addr">Address:</label></td>
			<td><input type="text" name="addr" id = "addr"/><br></td></tr>
			
			<tr><td><label for ="tele">Telephone:</label></td>
			<td><input type="text" name="tele" id = "tele"/><br></td></tr>
			
		</table>
		<input type="submit" value = "Register">
		<input type="submit" value= "Cancel">
	</body>
</html>