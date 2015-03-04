// data.h

struct XYCoordinates {
  int x;
  int y;
};

struct iDeviceToArduino {
  int foo;
  float bar;
  char quux;
  struct XYCoordinates coords;
};

struct ArduinoToIDevice {
  int x;
  int y;
}