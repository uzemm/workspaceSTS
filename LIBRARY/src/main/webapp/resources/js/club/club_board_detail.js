function cbRegCmt(){
	const formTag = document.getElementById('cbRegCmt');
	
	formTag.submit();
	location.reload();
}

function updateCmt(){
	var cmt = document.getElementById('updateCmt');
	cmt.innerHTML = '';
	
	var str = '';
	
	str += '<div id="updateCmt"><input type="text" value= ${cmt.cbCmtContent }></div>'
	
}