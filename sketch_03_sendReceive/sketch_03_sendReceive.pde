import websockets.*;

WebsocketClient wsc;
WebsocketServer wss;

//GLOBAL VARS
float posX = 0;
float posY = 0;

void setup()
{
  size(512,512);
  textAlign(CENTER);
}

void draw()
{
  background(0);
  ellipse(posX,posY,10,10);
  if(networkStatus < 1)
  {
    text("press 's' to start the server (receiving end)",width/2,height/2);
  }
  else if(networkStatus == STARTED_SERVER)
  {
    text("press 'c' to start the client (sending end)",width/2,height/2);
  }
  else
  {
    wsc.sendMessage(mouseX+","+mouseY);
  }
}

void keyPressed()
{
  if(key == 's')
  {
    //start networking
    initServer();
  }
  if(key == 'c')
  {
    initClient();
  }
}

void webSocketServerEvent(String msg){
 //RECEIVE MOUSE COORDINATES FROM ANOTHER SKETCH
 String[] workingStringArray = splitTokens(msg, ", ");
 if(workingStringArray.length > 1)
{
  posX = parseFloat(workingStringArray[0]);
  posY = parseFloat(workingStringArray[1]);
}
}
