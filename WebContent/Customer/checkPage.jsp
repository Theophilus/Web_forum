<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%> 
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="../Styles/styles.css">
<script type="text/javascript" src="../Scripts/script.js"></script>
<title></title>
</head>
<body>
	<%
	if(request.getParameter("topic") == null){
		session.setAttribute( "error", "ad error" );
		response.sendRedirect("cusPlaceAd.jsp");
	}
	if(request.getParameter("searchword") == null){
		session.setAttribute( "error", "ad error" );
		response.sendRedirect("cusPlaceAd.jsp");
	}
	if(request.getParameter("content") == null){
		session.setAttribute( "error", "ad error" );
		response.sendRedirect("cusPlaceAd.jsp");
	}
	if(request.getParameter("url") == null){
		session.setAttribute( "error", "ad error" );
		response.sendRedirect("cusPlaceAd.jsp");
	}
	int number = Integer.parseInt(request.getParameter("number"));
	int mw = Integer.parseInt(request.getParameter("weekmonth"));
	session.setAttribute("newprice",(number*mw));
	session.setAttribute("savedTopic",request.getParameter("topic"));
	session.setAttribute("savedSW",""+request.getParameter("searchword"));
	session.setAttribute("savedContent",""+request.getParameter("content"));
	session.setAttribute("savedUrl",""+request.getParameter("url"));
	session.setAttribute("savednum",request.getParameter("number"));
	session.setAttribute("savedwm",""+request.getParameter("weekmonth"));
	
	response.sendRedirect("confirm_ad.jsp");
	%>

</body>
</html>