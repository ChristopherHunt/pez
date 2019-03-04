#include <stdio.h>

#include "gpio/gpio.h"

int main(int argc, char **argv) {
  // Create GPIO object
  GPIO gpio(7);

  // Set pin high
  fprintf(stderr, "Setting pin hi!\n");
  gpio.exportPin();
  gpio.setDirection("out");
  gpio.setValue(1);
  fprintf(stderr, "Done!\n");

  return 0;
}
