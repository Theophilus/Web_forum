package model;

import java.sql.Date;
import java.util.Comparator;

public class Comment implements Comparable<Comment>{
	private int commentID;
	private int authorID;
	private int pid;
	private Date dateCreated;
	private String topic;
	private String content;
	private int upvotes;
	private int downvotes;
	
	public Comment(int commentID, int authorID, int pid, Date dateCreated,
			String topic, String content, int upvotes, int downvotes) {
		this.commentID = commentID;
		this.authorID = authorID;
		this.pid = pid;
		this.dateCreated = dateCreated;
		this.topic = topic;
		this.content = content;
		this.upvotes = upvotes;
		this.downvotes = downvotes;
	}

	public int getCommentID() {
		return commentID;
	}

	public void setCommentID(int commentID) {
		this.commentID = commentID;
	}

	public int getAuthorID() {
		return authorID;
	}

	public void setAuthorID(int authorID) {
		this.authorID = authorID;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public Date getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(Date dateCreated) {
		this.dateCreated = dateCreated;
	}

	public String getTopic() {
		return topic;
	}

	public void setTopic(String topic) {
		this.topic = topic;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getUpvotes() {
		return upvotes;
	}

	public void setUpvotes(int upvotes) {
		this.upvotes = upvotes;
	}

	public int getDownvotes() {
		return downvotes;
	}

	public void setDownvotes(int downvotes) {
		this.downvotes = downvotes;
	}
	
	@Override
	public int compareTo(Comment o) {
		int tscore = this.upvotes - this.downvotes;
		int oscore = o.upvotes - o.downvotes;
		if(tscore > oscore){
			return 1;
		}
		else if(tscore == oscore){
			return 0;
		}
		else
			return 1;
	}
	
	public static Comparator<Comment> BY_SCORE = new Comparator<Comment>(){
		public int compare(Comment c1, Comment c2){
			return c1.compareTo(c2);
		}
	};
	
}
