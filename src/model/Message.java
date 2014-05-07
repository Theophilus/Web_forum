package model;

import java.sql.Date;
import java.sql.Time;

public class Message {
	private int message_id;
	private int sender_id;
	private int receiver_id;
	private Date date_sent;
	private Time time_sent;
	private String subject;
	private String content;
	
	public Message(int message_id, int sender_id, int receiver_id,
			Date date_sent, Time time_sent, String subject, String content) {
		super();
		this.message_id = message_id;
		this.sender_id = sender_id;
		this.receiver_id = receiver_id;
		this.date_sent = date_sent;
		this.time_sent = time_sent;
		this.subject = subject;
		this.content = content;
	}
	
	public static Message newMessage(int sender_id, int receiver_id, String subject, String content){
		Message message = null;
		
		message = new Message(-1, sender_id, receiver_id, null, null, subject, content);
		
		return message;
	}

	public int getMessage_id() {
		return message_id;
	}

	public void setMessage_id(int message_id) {
		this.message_id = message_id;
	}

	public int getSender_id() {
		return sender_id;
	}

	public void setSender_id(int sender_id) {
		this.sender_id = sender_id;
	}

	public int getReceiver_id() {
		return receiver_id;
	}

	public void setReceiver_id(int receiver_id) {
		this.receiver_id = receiver_id;
	}

	public Date getDate_sent() {
		return date_sent;
	}

	public void setDate_sent(Date date_sent) {
		this.date_sent = date_sent;
	}

	public Time getTime_sent() {
		return time_sent;
	}

	public void setTime_sent(Time time_sent) {
		this.time_sent = time_sent;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	
}
