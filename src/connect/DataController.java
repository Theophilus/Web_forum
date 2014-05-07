package connect;

import java.sql.*;

public class DataController {
	public static int getUserID(String username){
		int id = -1;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(Database.url, Database.username, Database.password);
			
			String selectUsername = "SELECT account_id FROM account WHERE username = ?";
			PreparedStatement pstmt = conn.prepareStatement(selectUsername);
			pstmt.setString(1, username);
			
			ResultSet result = pstmt.executeQuery();
			if(!result.next()){
				return -1;
			}
			
			id = result.getInt("account_id");
			
			
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return id;
	}
	
	public static String getUsername(int userID){
		String username = null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(Database.url, Database.username, Database.password);
			
			String selectUsername = "SELECT username FROM account WHERE account_id = ?";
			PreparedStatement pstmt = conn.prepareStatement(selectUsername);
			pstmt.setInt(1, userID);
			
			ResultSet result = pstmt.executeQuery();
			result.next();
			
			username = result.getString("username");
			
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return username;
	}
	
	public static boolean isModerator(int userID){
		boolean result = false;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(Database.url, Database.username, Database.password);
			
			String queryMod = "SELECT moderator_id FROM moderatorAccount WHERE moderator_id = ?";
			PreparedStatement pstmt = conn.prepareStatement(queryMod);
			pstmt.setInt(1, userID);
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()){
				result = true;
			}
			else{
				result = false;
			}
			
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
	public static boolean userExists(String username){
		boolean result = false;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(Database.url, Database.username, Database.password);
			
			String queryMod = "SELECT username FROM account WHERE username = ?";
			PreparedStatement pstmt = conn.prepareStatement(queryMod);
			pstmt.setString(1, username);
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()){
				result = true;
			}
			else{
				result = false;
			}
			
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
	public static String getUserType(int userID){
		String type = "";
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(Database.url, Database.username, Database.password);
			
			String queryUser = "SELECT Atype FROM account WHERE userID = ?";
			PreparedStatement pstmt = conn.prepareStatement(queryUser);
			pstmt.setInt(1, userID);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()){
				type = rs.getString("Atype");
			}
			
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return type;
	}
}
