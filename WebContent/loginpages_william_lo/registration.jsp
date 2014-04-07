<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Forum Registration</title>
</head>
<body>
Please fill the following fields to complete your registration.
<p>
<FORM METHOD=POST ACTION="foo.jsp">
Username:			<INPUT TYPE=TEXT NAME=username SIZE=20><BR>
Password:			<INPUT TYPE=TEXT NAME=password SIZE=20><BR>
e-mail address:		<INPUT TYPE=TEXT NAME=email SIZE=20><BR>
First Name:			<INPUT TYPE=TEXT NAME=fname SIZE=20><BR>
Last Name:			<INPUT TYPE=TEXT NAME=lname SIZE=20><BR>
Company:			<INPUT TYPE=TEXT NAME=company SIZE=20><BR>
Address:			<INPUT TYPE=TEXT NAME=address SIZE=30><BR>
<<<<<<< HEAD
Telephone:			<INPUT TYPE=TEXT NAME=phone SIZE=15><BR>
<INPUT TYPE=SUBMIT>
</FORM>

=======
Telephone:			<INPUT TYPE=TEXT NAME=phone SIZE=12><BR>
<p><INPUT TYPE=SUBMIT VALUE="Submit">
</FORM><A HREF=index.jsp><INPUT TYPE=SUBMIT VALUE="Cancel"></A>
>>>>>>> FETCH_HEAD
</body>
</html>