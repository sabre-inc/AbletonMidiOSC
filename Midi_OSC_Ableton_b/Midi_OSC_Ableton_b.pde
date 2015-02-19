import oscP5.*;
import netP5.*;

import controlP5.*;

OscP5 oscSEND;
OscP5 oscRC;

ControlP5 cp5;

NetAddress remote;
NetAddress able;

void setup() {
  size(400,400);
  smooth();
  
  oscSEND = new OscP5(this, 9001);
  oscRC = new OscP5(this, 12001);
  
  able = new NetAddress("127.0.0.1", 9000);
  remote = new NetAddress("192.168.1.215", 12001);
  
  cp5 = new ControlP5(this);
  
  cp5.addButton("Play")
    .setValue(127)
    .setPosition(50,50)
    .setSize(50,50)
    ;
    
  cp5.addButton("Stop")
    .setValue(127)
    .setPosition(120,50)
    .setSize(50,50)
    ;
    
  cp5.addButton("Scene1")
    .setValue(127)
    .setPosition(50,150)
    .setSize(50,50)
    .setLabel("Scene 1")
    ;
    
  cp5.addButton("Clip1")
    .setValue(127)
    .setPosition(120, 150)
    .setSize(50,50)
    .setLabel("Clip 1")
    ;
    
  cp5.addButton("Clip2")
    .setValue(127)
    .setPosition(190, 150)
    .setSize(50, 50)
    .setLabel("Clip 2")
    ;
    
  
}

void draw() {
  background(0);
}

void Scene1() {
  oscSEND.send(able, "/live/play/scene", 0);
  oscRC.send(remote, "Scene1");
}

void Clip1() {
  oscSEND.send(able, "/live/play/clipslot", 0, 0);
}

void Clip2() {
  oscSEND.send(able, "/live/play/clipslot", 0, 1);
}

void oscEvent(OscMessage m) {
  println("OSC Message Inbound");
  println(", address: " + m.getAddress());
  
  oscSEND.send(able, m.getAddress(), 1);
}
