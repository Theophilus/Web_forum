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
			Connection conn = DriverManager.getConnection(dbaddress, "csuser", "csc5cb45");
			
			boolean dataOK = true;
			String title = request.getParameter("title");
			String topic = request.getParameter("topic");
			String search = request.getParameter("search");
			int userID  = -1;
			
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
				pstmt.setString(1, topic);
				ResultSet result = pstmt.executeQuery();
				if(result.next() != false){
			  		conn.close();
			  		response.sendRedirect("../Thread/newquestion.html");
			  		return;
			  	}
			}
			
			if(dataOK){
				String getID = "SELECT account_id as id FROM account WHERE username = ?";
				PreparedStatement pstmt = conn.prepareStatement(getID);
				String login = (String)session.getAttribute("username");
				pstmt.setString(1, login);
				ResultSet result = pstmt.executeQuery();
				result.next();
				userID = result.getInt("id");
				if(userID == -1 || userID == 0){
					conn.close();
					dataOK = false;
					return;
				}
			}
			//	if everything checks out, insert the data
			if(dataOK){
				Statement stmt = conn.createStatement();
				String countThreads = "SELECT COUNT(*) as count FROM thread";
				ResultSet result = stmt.executeQuery(countThreads);
				result.next();
				int count = result.getInt("count") + 1;
				
				//Date date = new java.sql.Date();
				String insert = "INSERT into thread(thread_id, topic, author_id, num_of_posts, num_of_searches, date_created, search_words, num_of_views)";
				insert += "VALUES(?, ?, ?, 0, 0, ?, ?, 0)";
				PreparedStatement pstmt = conn.prepareStatement(insert);
				pstmt.setString(1, count+"");
				pstmt.setString(2, topic);
				pstmt.setInt(3, userID);
				pstmt.setDate(4, new java.sql.Date(new java.util.Date().getTime()));
				pstmt.setString(5, search);
				
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