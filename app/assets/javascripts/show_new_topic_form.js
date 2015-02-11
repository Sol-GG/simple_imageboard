
window.onload = function(){
	document.getElementById("new_topic_bar").style.display = 'none';
}

function showTopicForm() {
	if (document.getElementById("new_topic_bar").style.display=='none'){
		document.getElementById("new_topic_bar").style.display = 'block';
	} else {
    	document.getElementById("new_topic_bar").style.display = 'none';
	}
}