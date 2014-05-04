package connect;

import java.sql.*;
import java.util.Collections;
import java.util.LinkedList;

import model.Comment;
import model.Post;
import model.Thread;

public class ThreadController {
	public static Thread getThread(int threadID){
		Thread thread = null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(Database.url, Database.username, Database.password);
			
			String selectThread = "SELECT * FROM thread WHERE thread_id = ?";
			PreparedStatement pstmt = conn.prepareStatement(selectThread);
			pstmt.setInt(1, threadID);
			ResultSet results = pstmt.executeQuery();
			results.next();
			
			String topic = results.getString("topic");
			int authorID = results.getInt("author_id");
			int postCount = results.getInt("num_of_posts");
			Date threadDate = results.getDate("threaddate");
			Time threadTime = results.getTime("threadtime");
			
			thread = new Thread(threadID, topic, authorID, postCount, threadDate, threadTime);
			
			Post question = getQuestion(threadID);
			thread.setQuestion(question);
			
			LinkedList<Comment> comments = getComments(question.getPostID());
			thread.setComments(comments);
			
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return thread;
	}
	
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
	
	public static Post getQuestion(int threadID){
		Post post = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(Database.url, Database.username, Database.password);
			
			String getQuestion = "SELECT * FROM post WHERE tid = ?";
			PreparedStatement pstmt = conn.prepareStatement(getQuestion);
			pstmt.setInt(1,  threadID);
			ResultSet results = pstmt.executeQuery();
			results.next();
			
			int authorID = results.getInt("author_id");
			int postID = results.getInt("post_id");
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
}
