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
	LinkedList<model.Thread> threadList = new LinkedList<model.Thread>();
	model.Thread currentThread = null;
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(Database.url, Database.username, Database.password);
		
		String getThreads = "SELECT topic, thread_id, num_of_post FROM thread";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(getThreads);
		
		
		while(rs.next()){
			int tid = rs.getInt("thread_id");
			String topic = rs.getString("topic");
			int postCount = rs.getInt("num_of_posts");
					
			currentThread = model.Thread.simpleThread(tid, topic, postCount);
			threadList.add(currentThread);
		}
		
		conn.close();
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="../Styles/styles.css">
<link rel="stylesheet" type="text/css" href="../Styles/threadstyles.css">
<title>Threads</title>
</head>
<body>
<%= HeaderGenerator.getHeader(DataController.getUserType(userID)) %>
<div id="userContent">
	<div class="threadBody"><br>
		<div class="threadTopic"><h1 class="topicLabel">Threads</h1></div>
		<%
			ListIterator<model.Thread> iterator = threadList.listIterator();
			currentThread = null;
			while(iterator.hasNext()){
				currentThread = iterator.next();
				out.print("<div class=\"comment\"><p><a href=\"../Thread/thread.jsp?threadid="+currentThread.getThreadID()+"\">"+currentThread.getTopic()+" ("+currentThread.getPostCount()+")</a></p></div>");
			}
			
		%>
	</div>
</div>
<%= HeaderGenerator.getFooter() %>
</body>
</html>