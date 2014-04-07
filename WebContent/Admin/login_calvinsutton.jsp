<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Login</title>

	</head>
	<body>
		<center>
		
		<h1>Welcome to Webhackers Forum.<br>
			Where we speak WEB!!!!</h1>
		</center>
		<table>
			<tr><td><label for ="un">Username:</label></td>
			<td><input type="text" name="un" id ="un"/><br></td></tr>
		
			<tr><td><label for ="pw">Password:</label></td>
			<td><input type="text" name="pw" id ="pw"/><br></td></tr>
		</table>
			<input type ="submit" value= "Login">
			<form name="customreg"  method="get" action="customerregister_calvinsutton.jsp">
        		<input type="submit" name="customreg" value="Customer Register" >
   			</form>
 			<form name="userreg"  method="get" action="userregister_calvinsutton.jsp">
 				<input type="submit" name="userreg" value="User Register" >
			</form>
	</body>
</html>