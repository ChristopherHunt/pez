#include <stdio.h>

#include "gpio/gpio.h"
#include "pwm/pwm.h"

int main(int argc, char **argv) {
  // Create GPIO object
  GPIO gpio(7);

  // Set pin high
  fprintf(stderr, "Setting pin hi!\n");
  gpio.exportPin();
  gpio.setDirection("out");
  gpio.setValue(1);
  fprintf(stderr, "Done!\n");

  // Create PWM object
  rpiPWM1 pwm(1000.0, 256, 80.0, rpiPWM1::MSMODE);

  return 0;
}
