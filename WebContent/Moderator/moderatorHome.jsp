<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.util.*" %>
<%@ page import="connect.*" %>
<%@ page import="model.*" %>
<%
	int userID = (Integer)session.getAttribute("uid");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="../Styles/styles.css">
<title>Moderator Homepage</title>
</head>
<body>
	<div id="header">
		
		<img class="head_img" src="../images/logo.png"/> 
		<a href="../"><button class="logout" type="button">logout</button></a> 
		
	</div>
	<div id="moderatorMenu">
		<ul>
		<li><a href="../Moderator/moderatorHome.jsp">Home</a></li>
		<li><a href="../Moderator/moderatorProfile.jsp">Profile</a></li>
		<li><a href="../Message/messagecenter.jsp">Messages</a></li>
		<li><a href="../Thread/threadlist.jsp">Threads</a></li>
		<li><a href="../Moderator/moderatorSearch.jsp">Search</a></li>
		</ul>
		
	</div>
	
	<div id="moderatorContent">
		<h3>Today's new posts</h3>
		<br>
		<p><a href="../Post/post.jsp?postid=0">topic</a></p>
		<%
			try{
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn = DriverManager.getConnection(Database.url, Database.username, Database.password);
				
				String getNewPosts = "SELECT topic, post_id FROM post WHERE date_created = CURDATE()";
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(getNewPosts);
				
				while(rs.next()){
					String topic = rs.getString("topic");
					int postID = rs.getInt("post_id");
					
					out.print("<p><a href=\"../Post/post.jsp?postid="+postID+"\">"+topic+"</a></p>");
				}
				
				conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		%>
	</div>
	<div id="footer">
		<p> &#169; webhackers</p>

	</div>

</body>
</html>