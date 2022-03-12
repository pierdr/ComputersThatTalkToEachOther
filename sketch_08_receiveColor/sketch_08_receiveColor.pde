import websockets.*;

WebsocketClient wsc;


color bg = color(0);

void setup(){
  size(200,200);
  
  
  wsc= new WebsocketClient(this, "ws://localhost:8080/");

}

void draw(){
  
  background(bg);
}

void webSocketEvent(String msg){
 println(msg);
 JSONObject json = parseJSONObject(msg);
  if (json == null) {
    println("JSONObject could not be parsed");
  } else {
    JSONObject col = json.getJSONObject("col");
    int r = col.getInt("r");
    int g = col.getInt("g");
    int b = col.getInt("b");
     bg = color(r,g,b);
  }
}
void keyPressed()
{
  if(key == 's')
  {
    int newR = (int) random(0,255);
    int newG = (int) random(0,255);
    int newB = (int) random(0,255);
    bg = color(newR,newG,newB);
    wsc.sendMessage("{\"col\":{\"r\":"+newR+",\"g\":"+newG+",\"b\":"+newB+"}}");
  }
}
