# variables to note the compiler
FCOMP := gfortran
COMP := g++

# set the compiler flags depending on whether we are in DEBUG mode
ifdef DEBUG
  FFLAGS := -g -O0 -fbacktrace -ffpe-trap=invalid,zero,overflow -finit-real=snan -Wuninitialized
  CFLAGS := -g -Wall -Wzero-as-null-pointer-constant -pedantic -std=c++11
else
  FFLAGS := -O
  CFLAGS := -O
endif

# list of source files
f90sources := compute.f90 print_result.f90
cxxsources := main.cpp githash.cpp

# the list of object files that need to be created -- here we use a
# makefile function to automatically change each .f90 into a .o
objects = $(f90sources:.f90=.o) $(cxxsources:.cpp=.o)

# main target to build
all: main

# inter-file dependencies
include GMake.inc


# githash.f90 is a special sourcefile that is created at compile time.
# note that we remove it on clean.
githash.cpp:
	./makegithash.sh

# a "pattern rule" to make a .o file from the corresponding .f90 or
# .cxx file.
# $< is an automatic variable that substitutes the name of the
# first "prerequisite" in the build.
%.o: %.f90
	$(FCOMP) $(FFLAGS) -c $<

%.o: %.cxx
	$(COMP) $(CFLAGS) -c $<

# rule to build the main target
main: $(objects)
	$(COMP) -o main $(objects) -lgfortran

# rule to remove intermediate .o and .mod files
clean:
	rm -f *.o *.mod
	rm -f githash.cpp

# PHONY tells make that clean is not a real file, so it will ensure
# that if you type "make clean" this is always executed.  This is only
# a problem if, somehow, you create an actualy file named "clean" in
# your directory -- then make will think that clean is up to date.
.PHONY: clean

# for debugging.  To see the value of a Makefile variable,
# e.g. FFLAGS, simply do "make print-FFLAGS".  This will
# print out the value.
print-%: ; @echo $* is $($*)
