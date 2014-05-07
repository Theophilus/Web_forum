package connect;

public class HeaderGenerator {
	public static String getUserHeader(){
		String header = ""
				+"<div id=\"header\">"
					+"<img class=\"head_img\" src=\"../images/logo.png\"/>" 
					+"<a href=\"../\"><button class=\"logout\" type=\"button\">logout</button></a>"
				+"</div>"
				+"<div id=\"userMenu\">"
					+"<ul>"
					+"<li><a href=\"userHome.jsp\">Home</a></li>"
					+"<li><a href=\"userProfile.jsp\">Profile</a></li>"
					+"<li><a href=\"userMessages.jsp\">Messages</a></li>"
					+"<li><a href=\"userForum.jsp\">Forum</a></li>"
					+"<li><a href=\"userAds.jsp\">Adverts</a></li>"
					+"<li><a href=\"userSearch.jsp\">Search</a></li>"
					+"<li><a href=\"userGuide.html\">User Guide</a></li>"
					+"</ul>"
				+"</div>";
		return header;
	}
	
	public static String getAdminHeader(){
		String header = ""
				+"<div id=\"header\">"
					+"<img class=\"head_img\" src=\"../images/logo.png\"/> "
					+"<a href=\"../\"><button class=\"logout\" type=\"button\">logout</button></a> "
				+"</div>"
				+"<div id=\"adminMenu\">"
					+"<ul>"
					+"<li><a href=\"adminHome.jsp\">Home</a></li>"
					+"<li><a href=\"adminProfile.jsp\">Profile</a></li>"
					+"<li><a href=\"adminMessages.jsp\">Messages</a></li>"
					+"<li><a href=\"adminForum.jsp\">Forum</a></li>"
					+"<li><a href=\"adminSearch.jsp\">Search</a></li>"
					+"<li><a href=\"createAdmin.html\">Create Admin</a></li>"
					+"<li><a href=\"createMod.html\">Create Moderator</a></li>"
					+"<li><a href=\"createCust.html\">Create Customer</a></li>"
					+"<li><a href=\"createUsr.html\">Create User</a></li>"
					+"<li><a href=\"sales.jsp\">Sales</a></li>"
					+"</ul>"
				+"</div>";
		
		return header;
	}
	
	public static String getCustomerHeader(){
		String header = ""
			+"<div id=\"header\">"
				+"<img class=\"head_img\" src=\"../images/logo.png\"/>" 
				+"<a  href=\"../\"><button class=\"logout\" type=\"button\">logout</button></a>" 
			+"</div>"
			+"<div id=\"customerMenu\">"
				+"<ul>"
				+"<li class=\"selected\"><a href=\"cusHome.jsp\">Home</a></li>"
				+"<li><a href=\"cusProfile.jsp\">Profile</a></li>"
				+"<li><a href=\"cusOrders.jsp\">Order History</a></li>"
				+"<li><a href=\"cusPlaceAd.jsp\">Place Add</a></li>"
				+"</ul>"
			+"</div>";
		return header;
	}
	
	public static String getModeratorHeader(){
		String header = "";
		return header;
	}
	
	public static String getFooter(){
		String footer = ""
				+"<div id=\"footer\">"
					+"<p> &#169; webhackers</p>"
				+"</div>";
		return footer;
	}
	
	public static String getHeader(String userType){
		if(userType.equals("customer")){
			return getCustomerHeader();
		}
		else if(userType.equals("admin")){
			return getAdminHeader();
		}
		else if(userType.equals("moderator")){
			return getModeratorHeader();
		}
		else{
			return getUserHeader();
		}
	}
}
