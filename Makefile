# Make file for Pillbox

SHELL       := /bin/bash
base_dir	  := $(CURDIR)
lib_dir  		:= $(base_dir)/lib
bin_dir  		:= $(base_dir)/bin

export base_dir
export bin_dir
export lib_dir
export LDFLAGS

# Enumeration of all of the library directories to compile for the project
gpio		:= src/lib/gpio
pwm     := src/lib/pwm
servo   := src/lib/servo

# Enumeration of all executables for this project
led_test 	 := src/app/led_test
servo_test := src/app/servo_test

# List containing all of the user libraries for the project
libraries := $(gpio) $(pwm) $(servo)

# List containing all of the user applications for the project
apps := $(led_test) $(servo_test)

# List of all directories to build from
dirs := $(libraries) $(apps)

.PHONY: all build debug dirs run $(dirs) $(apps) $(libraries)

all: build

dirs:
	mkdir -p $(bin_dir)
	mkdir -p $(lib_dir)

debug:
	$(eval LDFLAGS += -g)
	$(MAKE) build

build: clean dirs $(apps)

$(apps): $(libraries)
	-$(MAKE) -s -C $@

$(libraries):
	$(MAKE) -s -C $@

run:
	cd bin && ./driver

clean:
	$(RM) -rf $(lib_dir)
	$(RM) -rf $(bin_dir)
	for DIR in ${dirs}; do $(MAKE) -s -C $${DIR} clean; done
