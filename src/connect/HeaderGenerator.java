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
					+"<li><a href=\"../User/userHome.jsp\">Home</a></li>"
					+"<li><a href=\"../User/userProfile.jsp\">Profile</a></li>"
					+"<li><a href=\"../User/userMessages.jsp\">Messages</a></li>"
					+"<li><a href=\"../Thread/thread.jsp?threadid=1\">Forum</a></li>"
					+"<li><a href=\"../User/userAds.jsp\">Adverts</a></li>"
					+"<li><a href=\"../User/userSearch.jsp\">Search</a></li>"
					+"<li><a href=\"../User/userGuide.html\">User Guide</a></li>"
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
					+"<li><a href=\"../Admin/adminHome.jsp\">Home</a></li>"
					+"<li><a href=\"../Admin/adminProfile.jsp\">Profile</a></li>"
					+"<li><a href=\"../Admin/adminMessages.jsp\">Messages</a></li>"
					+"<li><a href=\"../Admin/adminForum.jsp\">Forum</a></li>"
					+"<li><a href=\"../Admin/adminSearch.jsp\">Search</a></li>"
					+"<li><a href=\"../Admin/createAdmin.html\">Create Admin</a></li>"
					+"<li><a href=\"../Admin/createMod.html\">Create Moderator</a></li>"
					+"<li><a href=\"../Admin/createCust.html\">Create Customer</a></li>"
					+"<li><a href=\"../Admin/createUsr.html\">Create User</a></li>"
					+"<li><a href=\"../Admin/sales.jsp\">Sales</a></li>"
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
				+"<li class=\"selected\"><a href=\"../Customer/cusHome.jsp\">Home</a></li>"
				+"<li><a href=\"../Customer/cusProfile.jsp\">Profile</a></li>"
				+"<li><a href=\"../Customer/cusOrders.jsp\">Order History</a></li>"
				+"<li><a href=\"../Customer/cusPlaceAd.jsp\">Place Add</a></li>"
				+"</ul>"
			+"</div>";
		return header;
	}
	
	public static String getModeratorHeader(){
		String header = ""
				+"<div id=\"header\">"
					+"<img class=\"head_img\" src=\"../images/logo.png\"/> "
					+"<a href=\"../\"><button class=\"logout\" type=\"button\">logout</button></a> "
				+"</div>"
				+"<div id=\"moderatorMenu\">"
					+"<ul>"
					+"<li><a href=\"../Moderator/moderatorHome.jsp\">Home</a></li>"
					+"<li><a href=\"../Moderator/moderatorProfile.jsp\">Profile</a></li>"
					+"<li><a href=\"../Message/messagecenter.jsp\">Messages</a></li>"
					+"<li><a href=\"../Thread/threadlist.jsp\">Threads</a></li>"
					+"<li><a href=\"../Moderator/moderatorSearch.jsp\">Search</a></li>"
					+"</ul>"
				+"</div>";
		
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
