package connect;

import java.sql.*;
import java.util.Collections;
import java.util.LinkedList;

import model.Comment;
import model.Post;
import model.Thread;

public class ThreadController {
	
	public static LinkedList<Comment> getComments(int postID){
		LinkedList<Comment> comments = null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(Database.url, Database.username, Database.password);
			
			String selectComments = "SELECT * FROM comment WHERE pid = ?";
			PreparedStatement pstmt = conn.prepareStatement(selectComments);
			pstmt.setInt(1, postID);
			
			ResultSet results = pstmt.executeQuery();
			
			comments = new LinkedList<Comment>();
			while(results.next()){
				int comment_id = results.getInt("comment_id");
				int author_id = results.getInt("author_id");
				int pid = results.getInt("pid");
				Date date_created = results.getDate("date_created");
				String topic = results.getString("topic");
				String content = results.getString("content");
				int num_of_upvote = results.getInt("num_of_upvote");
				int num_of_downvote = results.getInt("num_of_downvote");
				
				Comment currentComment = new Comment(comment_id, author_id, pid, date_created, topic, content, num_of_upvote, num_of_downvote);
				comments.add(currentComment);
			}
			
			Collections.sort(comments, Comment.BY_SCORE);
			
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return comments;
	}
	
	public static Post getQuestion(int postID){
		Post post = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(Database.url, Database.username, Database.password);
			
			String getQuestion = "SELECT * FROM post WHERE post_id = ?";
			PreparedStatement pstmt = conn.prepareStatement(getQuestion);
			pstmt.setInt(1,  postID);
			ResultSet results = pstmt.executeQuery();
			results.next();
			
			int authorID = results.getInt("author_id");
			int threadID = results.getInt("tid");
			int upvotes = results.getInt("num_of_likes");
			int downvotes = results.getInt("num_of_dislikes");
			int commentCount = results.getInt("num_of_comments");
			String searchWords = results.getString("search_words");
			String content = results.getString("content");
			String topic = results.getString("topic");
			Date creationDate = results.getDate("date_created");
			
			post = new Post(authorID, postID, threadID, upvotes, downvotes, commentCount, searchWords, content, topic, creationDate);
			
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return post;
	}
	
	public static int postQuestion(Post post, int userID){
		int threadID = -1;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(Database.url, Database.username, Database.password);
			
			PreparedStatement pstmt;
			ResultSet rs;
			
			/*	misunderstanding
			//	insert the thread
			String insertThread = "INSERT INTO thread (topic, author_id, num_of_posts, threaddate, threadtime)"
					+ "VALUES (?, ?, 0, CURDATE(), CURTIME())";
			pstmt = conn.prepareStatement(insertThread);
			pstmt.setString(1, post.getTopic());
			pstmt.setInt(2, userID);
			
			pstmt.executeUpdate();
			
			//	get the thread id
			String getTID = "SELECT LAST_INSERT_ID()";
			Statement stmt = conn.createStatement();
			rs = stmt.executeQuery(getTID);
			rs.next();
			
			threadID = rs.getInt(1);
			*/
			
			
			//	insert the post
			String insertPost = "INSERT INTO post (author_id, tid, date_created, topic, content, search_words, num_of_likes, num_of_dislikes, num_of_comments)"
					+ "VALUES (?, ?, CURDATE(), ?, ?, ?, 0, 0, 0)";
			pstmt = conn.prepareStatement(insertPost);
			pstmt.setInt(1, userID);
			pstmt.setInt(2, 1);
			pstmt.setString(3, post.getTopic());
			pstmt.setString(4, post.getContent());
			pstmt.setString(5, post.getSearchWords());
			
			pstmt.executeUpdate();
			
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return threadID;
	}
}
