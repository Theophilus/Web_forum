package connect;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Time;
import java.util.LinkedList;

import model.Message;

public class MessageController {
	public static boolean newMessage(Message message){
		boolean result = false;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(Database.url, Database.username, Database.password);
			
			PreparedStatement pstmt;
			
			//	insert the post
			String insertMessage = "INSERT INTO message (sender_id, receiver_id, date_sent, time_sent, subject, content)"
					+ "VALUES (?, ?, CURDATE(), CURTIME(), ?, ?)";
			pstmt = conn.prepareStatement(insertMessage);
			pstmt.setInt(1, message.getSender_id());
			pstmt.setInt(2, message.getReceiver_id());
			pstmt.setString(3, message.getSubject());
			pstmt.setString(4, message.getContent());
			
			pstmt.executeUpdate();
			
			conn.close();
			result = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public static LinkedList<Message> getMessagesByReceipient(int userID){
		LinkedList<Message> messages = new LinkedList<Message>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(Database.url, Database.username, Database.password);
			
			//	insert the post
			String insertMessage = "SELECT * FROM message WHERE receiver_id="+userID+" ORDER BY date_sent, time_sent DESC";
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(insertMessage);
			
			while(rs.next()){
				int message_id = rs.getInt("message_id");
				int sender_id = rs.getInt("sender_id");
				int receiver_id = rs.getInt("receiver_id");
				Date date_sent = rs.getDate("date_sent");
				Time time_sent = rs.getTime("time_sent");
				String subject = rs.getString("subject");
				String content = rs.getString("content");
				
				Message currentMessage = new Message(message_id, sender_id, receiver_id, date_sent, time_sent, subject, content);
				messages.add(currentMessage);
			}
			
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return messages;
	}
}
