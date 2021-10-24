
function del(n){
	
//	document.getElementById('BtnBox2').style.visibility = "hidden";
//	document.getElementById('password').style.visibility = "visible";

	
		

	document.getElementById('BtnBox2'+n).style.display = "none";
	document.getElementById('del-box'+n).style.display = "block";
	
	
}

function update(n) {
	document.getElementById('insert-form').style.display = "none";
	document.getElementById('update-form').style.display = "block";
	document.getElementById('msgBtn').style.display = "none";
	document.getElementById('BtnBox1').style.display = "block";
	
	document.getElementById('update-gName').value = document.getElementById('gName'+n).innerHTML
	document.getElementById('update-msg').value = document.getElementById('msg'+n).innerHTML
	document.getElementById('update-msgNo').value = document.getElementById('msgId'+n).innerHTML
	
}