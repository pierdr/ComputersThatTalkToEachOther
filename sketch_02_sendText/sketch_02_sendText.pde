import websockets.*;

WebsocketServer ws;
int now;


void setup(){
  size(200,200);
  ws= new WebsocketServer(this,8072,"/");
  now=millis();
  textAlign(CENTER);
}

void draw(){
  background(0);

  if(millis()>now+5000){
    ws.sendMessage("Server message "+millis());
    
    now=millis();
  }
  text("text sent "+((int)((millis()-now)/1000))+" seconds ago",width/2,height/2);
}

void webSocketServerEvent(String msg){
 println(msg);
}
