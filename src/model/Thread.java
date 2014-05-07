package model;

import java.sql.Date;
import java.sql.Time;
import java.util.LinkedList;

public class Thread {
	private int threadID;
	private int authorID;
	private int commentCount;
	
	private String topic;
	private Date threadDate;
	private Time threadTime;
	
	private Post question;
	
	private LinkedList<Post> posts;

	public Thread(int threadID, String topic, int authorID, int commentCount, 
			Date threadDate, Time threadTime) {
		this.threadID = threadID;
		this.authorID = authorID;
		this.commentCount = commentCount;
		this.topic = topic;
		this.threadDate = threadDate;
		this.threadTime = threadTime;
	}
	
	public LinkedList<Post> getPosts(){
		return this.posts;
	}
	
	public void setPosts(LinkedList<Post> posts){
		this.posts = posts;
	}
	
	public int getThreadID() {
		return threadID;
	}

	public void setThreadID(int threadID) {
		this.threadID = threadID;
	}

	public int getAuthorID() {
		return authorID;
	}

	public void setAuthorID(int authorID) {
		this.authorID = authorID;
	}

	public int getCommentCount() {
		return commentCount;
	}

	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}

	public String getTopic() {
		return topic;
	}

	public void setTopic(String topic) {
		this.topic = topic;
	}

	public Date getThreadDate() {
		return threadDate;
	}

	public void setThreadDate(Date threadDate) {
		this.threadDate = threadDate;
	}

	public Time getThreadTime() {
		return threadTime;
	}

	public void setThreadTime(Time threadTime) {
		this.threadTime = threadTime;
	}

	public Post getQuestion() {
		return question;
	}

	public void setQuestion(Post question) {
		this.question = question;
	}

}
