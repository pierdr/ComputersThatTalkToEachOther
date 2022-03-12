import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress remoteLocation;

//GLOBAL VARS
float posX = 0;
float posY = 0;

void setup()
{
  size(512, 512);
  textAlign(CENTER);
  oscP5 = new OscP5(this, 8070);
  remoteLocation = new NetAddress("10.0.1.89", 8075);
}

void draw()
{
  background(0);
  ellipse(posX, posY, 10, 10);
  
    OscMessage myMessage = new OscMessage("/exchangeColor");
    myMessage.add(millis()/1000); /* add mouseX to the osc message */
    myMessage.add(millis()/1000); /* add mouseX to the osc message */
    /* send the message */
    oscP5.send(myMessage, remoteLocation); 
  
}

void keyPressed()
{
  
}

void webSocketServerEvent(OscMessage oscMessage) {
  println("message received"+oscMessage);
  if (oscMessage.addrPattern() == "/exchangeColor")
  {
    posX = oscMessage.get(0).floatValue();
    posY = oscMessage.get(1).floatValue();
  }
}
