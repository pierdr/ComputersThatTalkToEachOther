
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
  //CONNECT TO ANOTHER CLIENT ON PORT 8070
  wsc = new WebsocketClient(this, "ws://10.28.22.230:8075/");
  networkStatus = STARTED_CLIENT;
} 
