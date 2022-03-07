
static final int INIT = 0;
static final int STARTED_SERVER = 1;
static final int STARTED_CLIENT = 2;
int networkStatus = INIT;
void initClient()
{
//RECEIVE FROM OTHERS ON PORT 8070
  wss = new WebsocketServer(this,7070,"/");
  networkStatus = STARTED_SERVER;
}
void initServer()
{
  //CONNECT TO ANOTHER CLIENT ON PORT 8069
  wsc = new WebsocketClient(this, "ws://127.0.0.1:8069/");
  networkStatus = STARTED_CLIENT;
} 
