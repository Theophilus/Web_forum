package model;

import java.sql.Date;
import java.sql.Time;
import java.util.LinkedList;

public class Thread {
	private int threadID;
	private int authorID;
	private int postCount;
	
	private String title;
	private Date threadDate;
	private Time threadTime;
	
	private LinkedList<Post> posts;
	
}
