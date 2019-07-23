# variables to note the compiler and options -- this makes it easier
# to change these as necessaey
FCOMP := gfortran
FFLAGS := -O

COMP := g++
CFLAGS := -O

# the list of source files that need to be compiled to make our
# executable
f90sources := compute.f90 print_result.f90
cxxsources := main.cpp

# the list of object files that need to be created -- here we use a
# makefile function to automatically change each .f90 into a .o
objects = $(f90sources:.f90=.o) $(cxxsources:.cpp=.o)

# main target to build
all: main

# a "pattern rule" to make a .o file from the corresponding .f90 or
# .cxx file.
# $< is an automatic variable that substitutes the name of the
# first "prerequisite" in the build.
%.o: %.f90
	$(FCOMP) $(FFLAGS) -c $<

%.o: %.cxx
	$(COMP) $(CFLAGS) -c $<

# the rule to make the executable -- note that it depends on all
# of the objects being made
main: $(objects)
	$(COMP) -o main $(objects) -lgfortran

# a special target that cleans up
clean:
	rm -f *.o *.mod

# PHONY tells make that clean is not a real file, so it will ensure
# that if you type "make clean" this is always executed.  This is only
# a problem if, somehow, you create an actualy file named "clean" in
# your directory -- then make will think that clean is up to date.
.PHONY: clean
