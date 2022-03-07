import websockets.*;

WebsocketClient wsc;


String textR = "";
void setup(){
  size(200,200);
   //CLIENT NEEDS THE IP ADDRESS OF THE SERVER AND CONNECTS TO IT
   //127.0.0.1 or localhost means the local machine
  wsc= new WebsocketClient(this, "ws://127.0.0.1:8072/");

  textAlign(CENTER);
}

void draw(){
  background(0);
  text(textR,width/2,height/2);
}

void webSocketEvent(String msg){
 println(msg);
 textR = msg;
}
