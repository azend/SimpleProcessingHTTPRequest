import processing.net.*;

Client client;
String buffer;

void setup () {
  size( 400, 400 );
  
  buffer = "";
  
  buffer += "-- Creating a new connection with the host --\r\n";
  client = new Client(this, "azend.org", 80);
  
  buffer += "-- Sending the HTTP request --\r\n";
  client.write(
    "HEAD / HTTP/1.1\r\n" + 
    "Host: azend.org\r\n" +
    "\r\n"
  );
  
  buffer += "-- Waiting for the response --\r\n";
}

void draw() {
  if (client.available() > 0) {
    buffer += client.readString();
    client.clear();
  }
  
  background(0);
  fill(0, 255, 0);
  text( buffer, 10, 20 );
}
