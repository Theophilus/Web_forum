function userExits(user){
	alert("username "+user+ " already exits in system.");
	
}

function emailExits(email){
	alert("email "+email+ " already exits in system.");
}

function wrongImput(){
	alert("User name does not exist");
}

$("#adminMenu").load( function changeTo(pagename){
	var x = document.getElementById("adminContent");
	if(pagename == "admin"){
		
		x.innerHTML = "adminReg.html";
	}
	if(pagename ==""){
		
	}
	if(pagename ==""){
	
	}
	if(pagename ==""){
	
	}
	
});