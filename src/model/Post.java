package model;

import java.sql.Date;
import java.sql.Time;
import java.util.LinkedList;

public class Post {
	private int authorID;
	private int postID;
	private int threadID;
	private int upvotes;
	private int downvotes;
	private int commentCount;
	
	private String searchWords;
	private String content;
	private String topic;
	
	private Date creationDate;
	private Time editTime;
	private Date deletionDate;
	private Time deletionTime;
	
	private LinkedList<Comment> comments;
	
	public Post(int authorID, int postID, int threadID, int upvotes,
			int downvotes, int commentCount, String searchWords,
			String content, String topic, Date creationDate) {
		this.authorID = authorID;
		this.postID = postID;
		this.threadID = threadID;
		this.upvotes = upvotes;
		this.downvotes = downvotes;
		this.commentCount = commentCount;
		this.searchWords = searchWords;
		this.content = content;
		this.topic = topic;
		this.creationDate = creationDate;
	}
	
	public static Post newPost(int authorID, String topic, String searchWords, String content){
		int threadID = -1;
		int postID = -1;
		int upvotes = 0;
		int downvotes = 0;
		int commentCount = 0;
		Date creationDate = null;
		
		Post result = new Post(authorID, postID, threadID, upvotes, downvotes, 
				commentCount, searchWords, content, topic, creationDate);
		
		return result;
	}

	public LinkedList<Comment> getComments() {
		return comments;
	}

	public void setComments(LinkedList<Comment> comments) {
		this.comments = comments;
	}
	
	public Time getEditTime() {
		return editTime;
	}

	public Time getDeletionTime() {
		return deletionTime;
	}

	public void setEditTime(Time creationTime) {
		this.editTime = creationTime;
	}

	public void setDeletionTime(Time deletionTime) {
		this.deletionTime = deletionTime;
	}

	public int getAuthorID() {
		return authorID;
	}

	public int getPostID() {
		return postID;
	}

	public int getThreadID() {
		return threadID;
	}

	public int getUpvotes() {
		return upvotes;
	}

	public int getDownvotes() {
		return downvotes;
	}

	public int getCommentCount() {
		return commentCount;
	}

	public String getSearchWords() {
		return searchWords;
	}

	public String getContent() {
		return content;
	}
	
	public String getTopic() {
		return topic;
	}

	public Date getCreationDate() {
		return creationDate;
	}

	public Date getDeletionDate() {
		return deletionDate;
	}

	public void setUpvotes(int upvotes) {
		this.upvotes = upvotes;
	}

	public void setDownvotes(int downvotes) {
		this.downvotes = downvotes;
	}

	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}

	public void setSearchWords(String searchWords) {
		this.searchWords = searchWords;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	public void setTopic(String topic) {
		this.topic = topic;
	}

	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}

	public void setDeletionDate(Date deletionDate) {
		this.deletionDate = deletionDate;
	}
	
	
}
