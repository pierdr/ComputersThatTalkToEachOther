const WebSocket = require('ws');
const server = new WebSocket.Server({
  port: 8080
});

console.log("server running at port "+server.address().port);

let sockets = [];
server.on('connection', function(socket, req) {
  sockets.push(socket);
   const ip = req.socket.remoteAddress;
  console.log("connected new socket with IP:"+ip);
  socket.ip = ip;

  // When you receive a message, send that message to the next socket.
  socket.on('message', function(msg) {


    console.log("message received from:"+ip);
    for(var i = 0;i<sockets.length;i++)
    {
        // Look for all the sockets and search for the socket that has the same IP Address
        if(ip == sockets[i].ip)
        {
          //send message to the next socket
          if(i != sockets.length-1)
          {
            sockets[i+1].send(msg+"");
            console.log("send msg to:"+sockets[i+1].ip);
          }
          else {
            sockets[0].send(msg+"");
            console.log("send msg to:"+sockets[0].ip);
          }
        }
    }
  });

  // When a socket closes, or disconnects, remove it from the array.
  socket.on('close', function() {
    console.log("disconnected:"+socket.ip);
    sockets = sockets.filter(s => s !== socket);
  });
});
