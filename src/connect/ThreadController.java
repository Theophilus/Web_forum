package connect;

import java.sql.*;
import java.sql.DriverManager;
import java.util.LinkedList;

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
			
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return thread;
	}
	
	public static LinkedList<Post> getPosts(int threadID){
		LinkedList<Post> posts = null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(Database.url, Database.username, Database.password);
			
			String selectPosts = "SELECT * FROM post WHERE tid = ? ORDER BY num_of_likes DESC";
			PreparedStatement pstmt = conn.prepareStatement(selectPosts);
			pstmt.setInt(1, threadID);
			
			ResultSet results = pstmt.executeQuery();
			
			posts = new LinkedList<Post>();
			while(results.next()){
				int post_id = results.getInt("post_id");
				int author_id = results.getInt("author_id");
				int tid = results.getInt("tid");
				Date date_created = results.getDate("date_created");
				String topic = results.getString("topic");
				String content = results.getString("content");
				String search_words = results.getString("search_words");
				int num_of_likes = results.getInt("num_of_likes");
				int num_of_dislikes = results.getInt("num_of_dislikes");
				int num_of_comments = results.getInt("num_of_comments");
				
				Post currentPost = new Post(author_id, post_id, tid, num_of_likes,
						num_of_dislikes, num_of_comments, search_words, content, topic, date_created);
				posts.add(currentPost);
			}
			
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return posts;
	}
}
