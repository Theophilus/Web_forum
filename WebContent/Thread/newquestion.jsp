<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Submit new question data</title>
</head>
<body>
	<%
		try{
			//	setup
			String dbaddress = "jdbc:mysql://cs336-26.cs.rutgers.edu:3306/projtest";
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(url, "csuser", "csc5cb45");
			
			boolean dataOK = true;
			String title = request.getParameter("title");
			String topic = request.getParameter("topic");
			String search = request.getParameter("search");
			
			//	make sure a title and topic are entered
			if(title.equals("") || topic.equals("")){
				dataOK = false;	
				conn.close();
		  		response.sendRedirect("../Thread/newquestion.html");
		  		return;
			}
			//	make sure a thread with the same title doesn't already exist
			if(dataOK){
				
				String titleCheck = "SELECT topic FROM thread WHERE topic = ?";
				PreparedStatement pstmt = conn.prepareStatement(titleCheck);
				ps.setString(1, topic);
				ResultSet result = pstmt.executeQuery();
				if(result.next() != false){
			  		conn.close();
			  		response.sendRedirect("../Thread/newquestion.html");
			  		return;
			  	}
			}
			//	if everything checks out, insert the data
			if(dataOK){
				Statement stmt = conn.createStatement();
				String countThreads = "SELECT COUNT(*) as count FROM thread";
				result = stmt.executeQuery(countThreads);
				int count = result.getInt("count") + 1;
				
				Date date = new Date();
				String insert = "INSERT into Thread(thread_id, topic, author_id, num_of_posts, num_of_searches, date_created, search_words, num_of_views)";
				insert += "VALUES(?, ?, ?, 0, 0, date, ?, 0)";
				PreparedStatement pstmt = conn.prepareStatement(insert);
				pstmt.setString(1, count);
				pstmt.setString(2, topic);
				pstmt.setString(3, "needUser");
				pstmt.setString(4, search);
				
				pstmt.executeUpdate();
			}
			
			conn.close();	
		}
		catch(Exception e){
			out.println("Exception: "+e);
		}
	%>
</body>
</html>