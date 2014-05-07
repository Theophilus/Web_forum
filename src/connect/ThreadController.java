package connect;

import java.sql.*;
import java.util.Collections;
import java.util.LinkedList;

import model.Comment;
import model.Post;

public class ThreadController {
	//	TODO update edits table for any edit
	Connection conn;
	
	private static int tempThreadID = 1;
	
	public ThreadController(){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(Database.url, Database.username, Database.password);
		}catch(Exception e){
			e.printStackTrace();
		}
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
	
	public static LinkedList<Post> getPosts(int threadID){
		LinkedList<Post> posts = null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(Database.url, Database.username, Database.password);
			
			String selectComments = "SELECT * FROM post WHERE tid = ? ORDER BY date_created, num_of_likes DESC";
			PreparedStatement pstmt = conn.prepareStatement(selectComments);
			pstmt.setInt(1, threadID);
			
			ResultSet results = pstmt.executeQuery();
			
			posts = new LinkedList<Post>();
			Post currentPost = null;
			while(results.next()){
				int authorID = results.getInt("author_id");
				int postID = results.getInt("post_id");
				int tid = results.getInt("tid");
				int upvotes = results.getInt("num_of_likes");
				int downvotes = results.getInt("num_of_dislikes");
				int commentCount = results.getInt("num_of_comments");
				String searchWords = results.getString("search_words");
				String content = results.getString("content");
				String topic = results.getString("topic");
				Date creationDate = results.getDate("date_created");
				
				currentPost = new Post(authorID, postID, tid, upvotes, downvotes, commentCount, searchWords, content, topic, creationDate);
				posts.add(currentPost);
			}
			
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return posts;
	}
	
	public static Comment getComment(int commentID){
		Comment comment = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(Database.url, Database.username, Database.password);
			
			String getQuestion = "SELECT * FROM comment WHERE comment_id = ?";
			PreparedStatement pstmt = conn.prepareStatement(getQuestion);
			pstmt.setInt(1,  commentID);
			ResultSet rs = pstmt.executeQuery();
			if(!rs.next()){
				System.err.println("Result set empty for getComment!");
				return null;
			}else{
				int comment_id = rs.getInt("comment_id");
				int author_id = rs.getInt("author_id");
				int pid = rs.getInt("pid");
				Date date_created = rs.getDate("date_created");
				String topic = rs.getString("topic");
				String content = rs.getString("content");
				int num_of_upvote = rs.getInt("num_of_upvote");
				int num_of_downvote = rs.getInt("num_of_downvote");
				
				comment = new Comment(comment_id, author_id, pid, date_created, topic, content, num_of_upvote, num_of_downvote);
			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return comment;
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
			
			LinkedList<Comment> comments = getComments(postID);
			post.setComments(comments);
			
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return post;
	}
	
	public static int postQuestion(Post post, int userID){
		int postID = -1;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(Database.url, Database.username, Database.password);
			
			PreparedStatement pstmt;
			
			//	insert the post
			String insertPost = "INSERT INTO post (author_id, tid, date_created, topic, content, search_words, num_of_likes, num_of_dislikes, num_of_comments)"
					+ "VALUES (?, ?, CURDATE(), ?, ?, ?, 0, 0, 0)";
			pstmt = conn.prepareStatement(insertPost);
			pstmt.setInt(1, userID);
			pstmt.setInt(2, tempThreadID);	//	THIS IS THE THREAD ID FOR USER POSTS?	CHANGE BELOW TOO IF NEEDED
			pstmt.setString(3, post.getTopic());
			pstmt.setString(4, post.getContent());
			pstmt.setString(5, post.getSearchWords());
			
			pstmt.executeUpdate();
			
			String getPID = "SELECT LAST_INSERT_ID()";
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(getPID);
			rs.next();
			
			postID = rs.getInt(1);
			
			String updatePostCount = "UPDATE thread SET num_of_posts = num_of_posts+1 WHERE thread_id = ?";
			pstmt = conn.prepareStatement(updatePostCount);
			pstmt.setInt(1, tempThreadID);
			pstmt.executeUpdate();
			
			
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return postID;
	}
	
	public boolean editPost(Post oldPost, Post newPost) throws SQLException{
		boolean result = false;
		try{
			conn.setAutoCommit(false);
			
			String insertEdit = "INSERT INTO editedPost (pid, editor_id, oldcontent, editdate, edittime) VALUES (?, ?, ?, CURDATE(), CURTIME())";
			PreparedStatement pstmt = conn.prepareStatement(insertEdit);
			pstmt.setInt(1, oldPost.getPostID());
			pstmt.setInt(2, newPost.getAuthorID());
			pstmt.setString(3, oldPost.getContent());
			
			pstmt.executeUpdate();
			
			String editOld = "UPDATE post SET topic = ?, search_words = ?, content = ? WHERE post_id = ?";
			pstmt = conn.prepareStatement(editOld);
			pstmt.setString(1, newPost.getTopic());
			pstmt.setString(2, newPost.getSearchWords());
			pstmt.setString(3, newPost.getContent());
			pstmt.setInt(4, oldPost.getPostID());
			
			pstmt.executeUpdate();
			
			conn.commit();
			result = true;
		}catch(SQLException e){
			if(conn != null){
				result = false;
				System.err.println("Rolling back transaction.");
				conn.rollback();
			}
		}finally{
			conn.setAutoCommit(true);
			conn.close();
		}
		return result;
	}
	
	public boolean deletePost(Post post, int editorID) throws SQLException{
		boolean result = false;
		try{
			conn.setAutoCommit(false);
			
			String insertEdit = "INSERT INTO deletedPost (pid, author_id, tid, date_created, topic, content, search_words, num_of_likes, num_of_dislikes, num_of_comments, editor_id, editdate, edittime)"
					+ "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, CURDATE(), CURTIME())";
			PreparedStatement pstmt = conn.prepareStatement(insertEdit);
			pstmt.setInt(1, post.getPostID());
			pstmt.setInt(2, post.getAuthorID());
			pstmt.setInt(3, post.getThreadID());
			pstmt.setDate(4, post.getCreationDate());
			pstmt.setString(5, post.getContent());
			pstmt.setString(6, post.getTopic());
			pstmt.setString(7, post.getSearchWords());
			pstmt.setInt(8, post.getUpvotes());
			pstmt.setInt(9, post.getDownvotes());
			pstmt.setInt(10, post.getCommentCount());
			pstmt.setInt(11, editorID);
			
			pstmt.executeUpdate();
			
			String deleteOld = "DELETE FROM post WHERE post_id = ?";
			pstmt = conn.prepareStatement(deleteOld);
			pstmt.setInt(1, post.getPostID());
			
			pstmt.executeUpdate();
			
			String updatePostCount = "UPDATE thread SET num_of_posts = num_of_posts-1 WHERE thread_id = ?";
			pstmt = conn.prepareStatement(updatePostCount);
			pstmt.setInt(1, tempThreadID);
			
			pstmt.executeUpdate();
			
			
			conn.commit();
			result = true;
		}catch(SQLException e){
			if(conn != null){
				System.err.println("Rolling back transaction.");
				conn.rollback();
			}
		}finally{
			conn.setAutoCommit(true);
			conn.close();
		}
		return result;
	}
	
	public static boolean postComment(Comment comment){
		boolean result = false;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(Database.url, Database.username, Database.password);
			
			String insertComment = "INSERT INTO comment (author_id, pid, date_created, topic, content, num_of_upvote, num_of_downvote)"
					+ "	VALUES (?, ?, CURDATE(), ?, ?, 0, 0)";
			PreparedStatement pstmt = conn.prepareStatement(insertComment);
			pstmt.setInt(1, comment.getAuthorID());
			pstmt.setInt(2, comment.getPid());
			pstmt.setString(3, comment.getTopic());
			pstmt.setString(4, comment.getContent());
			
			pstmt.executeUpdate();
			
			String updateCounter = "UPDATE post SET num_of_comments = num_of_comments+1 WHERE post_id = ?";
			pstmt = conn.prepareStatement(updateCounter);
			pstmt.setInt(1, comment.getPid());
			
			pstmt.executeUpdate();
			
			conn.close();
			result = true;
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
	public boolean editComment(Comment oldComment, Comment newComment, int editorID) throws SQLException{
		boolean result = false;
		try{
			conn.setAutoCommit(false);
			String insertEdit = "INSERT INTO editedComment (cid, editor_id, oldcontent, editdate, edittime)"
					+ "VALUES (?, ?, ?, CURDATE(), CURTIME())";
			PreparedStatement pstmt = conn.prepareStatement(insertEdit);
			pstmt.setInt(1, oldComment.getCommentID());
			pstmt.setInt(2, editorID);
			pstmt.setString(3, oldComment.getContent());
			
			pstmt.executeUpdate();
			
			String updateComment = "UPDATE comment SET topic = ?, content = ? WHERE comment_id = ?";
			pstmt = conn.prepareStatement(updateComment);
			pstmt.setString(1, newComment.getTopic());
			pstmt.setString(2, newComment.getContent());
			pstmt.setInt(3, oldComment.getCommentID());

			pstmt.executeUpdate();
			
			conn.commit();
			result = true;
		}catch(SQLException e){
			result = false;
			System.err.println("Rolling back transaction.");
			conn.rollback();
		}finally{
			conn.setAutoCommit(true);
			conn.close();
		}
		return result;
	}
	
	public boolean deleteComment(Comment comment, int editorID) throws SQLException{
		boolean result = false;
		try{
			conn.setAutoCommit(false);
			
			String insertDeletion = "INSERT INTO deletedComment (comment_id, author_id, pid, date_created, topic, content, num_of_upvote, num_of_downvote, editor_id, editdate, edittime)"
					+ "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, CURDATE(), CURTIME())";
			PreparedStatement pstmt = conn.prepareStatement(insertDeletion);
			pstmt.setInt(1, comment.getCommentID());
			pstmt.setInt(2, comment.getAuthorID());
			pstmt.setInt(3, comment.getPid());
			pstmt.setDate(4, comment.getDateCreated());
			pstmt.setString(5, comment.getTopic());
			pstmt.setString(6, comment.getContent());
			pstmt.setInt(7, comment.getUpvotes());
			pstmt.setInt(8, comment.getDownvotes());
			pstmt.setInt(9, editorID);
			
			pstmt.executeUpdate();
			
			String deleteComment = "DELETE FROM comment WHERE comment_id = ?";
			pstmt = conn.prepareStatement(deleteComment);
			pstmt.setInt(1, comment.getCommentID());
			
			pstmt.executeUpdate();
			
			String updateCounter = "UPDATE post SET num_of_comments = num_of_comments-1 WHERE post_id = ?";
			pstmt = conn.prepareStatement(updateCounter);
			pstmt.setInt(1, comment.getPid());
			
			pstmt.executeUpdate();
			
			
			conn.commit();
		}catch(SQLException e){
			result = false;
			e.printStackTrace();
			System.err.println("Rolling back transaction.");
			conn.rollback();
		}finally{
			conn.setAutoCommit(true);
			conn.close();
		}
		return result;
	}
	
	public static boolean vote(int itemID, Action type, int voterID){
		boolean result = false;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(Database.url, Database.username, Database.password);
			PreparedStatement pstmt = null;
			
			String table = "";
			String voteClass = "";
			String column = "";
			
			if(type == Action.PVOTEUP || type == Action.PVOTEDOWN ){
				table = "post";
				column = "post_id";
				
				String insertVoteTable = "INSERT INTO postVote (voter_id, content_id, v_type, v_date, v_time) "
						+ "VALUES (?, ?, ?, CURDATE(), CURTIME())";
				pstmt = conn.prepareStatement(insertVoteTable);
				pstmt.setInt(1, voterID);
				pstmt.setInt(2, itemID);
				if(type == Action.PVOTEUP){
					pstmt.setString(3, "upvote");
				}
				else{
					pstmt.setString(3, "downvote");
				}
				pstmt.executeUpdate();
				
				System.out.println("executed pid="+itemID);
			}
			else if(type == Action.CVOTEUP || type == Action.CVOTEDOWN){
				table = "comment";
				column = "comment_id";
				
				String insertVoteTable = "INSERT INTO commentVote (voter_id, content_id, v_type, v_date, v_time) "
						+ "VALUES (?, ?, ?, CURDATE(), CURTIME())";
				pstmt = conn.prepareStatement(insertVoteTable);
				pstmt.setInt(1, voterID);
				pstmt.setInt(2, itemID);
				if(type == Action.CVOTEUP){
					pstmt.setString(3, "upvote");
				}
				else{
					pstmt.setString(3, "downvote");
				}
				pstmt.executeUpdate();
			}
			if(type == Action.PVOTEUP){
				voteClass = "num_of_likes";
			}
			else if(type == Action.PVOTEDOWN){
				voteClass = "num_of_dislikes";
			}
			else if(type == Action.CVOTEUP){
				voteClass = "num_of_upvote";
			}
			else if(type == Action.CVOTEDOWN){
				voteClass = "num_of_downvote";
			}
			
			String insertVote = "UPDATE "+table+" SET "+voteClass+" = "+voteClass+"+1 WHERE "+column+" = "+itemID;
			Statement stmt = conn.createStatement();
			stmt.executeUpdate(insertVote);
			
			
			
			conn.close();
			result = true;
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
}
