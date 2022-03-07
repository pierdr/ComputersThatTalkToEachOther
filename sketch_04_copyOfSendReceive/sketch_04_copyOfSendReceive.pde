import websockets.*;

WebsocketClient wsc;
WebsocketServer wss;

//GLOBAL VARS
float posX = 0;
float posY = 0;

void setup()
{
  size(512, 512);
  textAlign(CENTER);
}

void draw()
{
  background(0);
  ellipse(posX, posY, 10, 10);
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

void webSocketServerEvent(String msg) {
  //RECEIVE MOUSE COORDINATES FROM ANOTHER SKETCH
  String[] workingStringArray = splitTokens(msg, ", ");
  if (workingStringArray.length > 1)
  {
    posX = parseFloat(workingStringArray[0]);
    posY = parseFloat(workingStringArray[1]);
  }
}



static final int INIT = 0;
static final int STARTED_SERVER = 1;
static final int STARTED_CLIENT = 2;
int networkStatus = INIT;
void initServer()
{
//RECEIVE FROM OTHERS ON PORT 8070
  wss = new WebsocketServer(this,8070,"/");
  networkStatus = STARTED_SERVER;
}
void initClient()
{
  //CONNECT TO ANOTHER CLIENT ON PORT 7070
  wsc = new WebsocketClient(this, "ws://127.0.0.1:7070/");
  networkStatus = STARTED_CLIENT;
} 
