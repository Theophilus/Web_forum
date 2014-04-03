<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Main</title>
</head>
<body>
<p>I am testing my jsp skills</p>
<!--  <%out.println("Hello World"); %> -->
<div id="system_data" >
<%java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MM/yyyy"); %>
<h1>Current Date: <%= df.format(new java.util.Date()) %> </h1>
<p> java.version is <%= System.getProperty("java.version") %></p>
<p> java.home is <%= System.getProperty("java.home") %> </p>
<p> os name is <%= System.getProperty("os.name") %> </p>
<p> user name is <%= System.getProperty("user.name") %>  </p>
<p> user home is <%= System.getProperty("user.home") %> </p>
<p> user directory is <%= System.getProperty("user.dir") %> </p>
</div>
<p>
<TABLE BORDER=4>
<%
    for ( int i = 0; i < 10; i++ ) {
        %>
        <TR>
        <TD>Number</TD>
        <TD><%= i+1 %></TD>
        </TR>
        <%
    }
%>
</TABLE>
</p>
<script type="text/javascript">
document.getElementById("system_data").innerHTML= "I changed all of that shit to this shit";
</script>

</body>
</html>