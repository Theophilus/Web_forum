package model;

import java.sql.Date;
import java.sql.Time;
import java.util.LinkedList;

public class Thread {
	private int threadID;
	private int authorID;
	private int postCount;
	
	private String topic;
	private Date threadDate;
	private Time threadTime;
	
	private LinkedList<Post> posts;

	public Thread(int threadID, String topic, int authorID, int postCount, 
			Date threadDate, Time threadTime) {
		this.threadID = threadID;
		this.authorID = authorID;
		this.postCount = postCount;
		this.topic = topic;
		this.threadDate = threadDate;
		this.threadTime = threadTime;
	}

	public LinkedList<Post> getPosts() {
		return posts;
	}

	public void setPosts(LinkedList<Post> posts) {
		this.posts = posts;
	}
}
