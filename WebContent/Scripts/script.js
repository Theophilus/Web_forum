function userExits(user){
	alert("username "+user+ " already exits in system.");
	
}

function emailExits(email){
	alert("email "+email+ " already exits in system.");
}

function regError(error){
window.print("in error");
	if(error == "userExists"){
		alert("username "+user+ " already exits in system.");
		
	}
	return;
	
}

function regError(){
	window.print("in error");
		//if(error == "userExists"){
			alert("username "+user+ " already exits in system.");
			
		//}
		//return;
		
}

function changeTo(pagename){
	var x = document.getElementById("adminContent");
	
	if(pagename == "admin"){
		
		x.innerHTML = adminReg.html;
	}
	if(pagename ==""){
		
	}
	if(pagename ==""){
	
	}
	if(pagename ==""){
	
	}
	
}