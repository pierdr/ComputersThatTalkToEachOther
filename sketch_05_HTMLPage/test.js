document.addEventListener('DOMContentLoaded', function(){
	console.log("STARTED");


	let socket = new WebSocket("ws://localhost:8080");

	socket.onopen = function(e) {
		console.log("[open] Connection established");

	};

	socket.onmessage = function(event) {
		console.log(`[message] Data received from server: ${event.data}`);
		const obj = JSON.parse(event.data);
		if(obj.col)
		{
			var r = obj.col.r;
			var g = obj.col.g;
			var b = obj.col.b;

			var centeredDiv = document.getElementById("centered");
			centeredDiv.style.background = "rgb("+r+","+g+","+b+")"; 
		}
	};

	socket.onclose = function(event) {
		if (event.wasClean) {
			console.log(`[close] Connection closed cleanly, code=${event.code} reason=${event.reason}`);
		} else {
		    // e.g. server process killed or network down
		    // event.code is usually 1006 in this case
		    console.log('[close] Connection died');
		}
	};

	socket.onerror = function(error) {
		console.log(`[error] ${error.message}`);
	};

	var sendButton = document.getElementById("send");
	sendButton.onclick = function()
	{
		// socket.send();
		console.log("button pressed");
		var newR = Math.floor(Math.random() * 255);
		var newG = Math.floor(Math.random() * 255);
		var newB = Math.floor(Math.random() * 255);
		socket.send("{\"col\":{\"r\":"+newR+",\"g\":"+newG+",\"b\":"+newB+"}}");

		var centeredDiv = document.getElementById("centered");
		centeredDiv.style.background = "rgb("+newR+","+newG+","+newB+")"; 

	}
});