# computer and compilation options
FCOMP := gfortran
FFLAGS := -O

COMP := g++
CFLAGS := -O

# list of source files
f90sources := compute.f90 print_result.f90
cxxsources := main.cpp

# list of resulting object files
objects = $(f90sources:.f90=.o) $(cxxsources:.cpp=.o)

# main target to build
all: main

# inter-file dependencies
print_result.o: compute.o

# rule to make a .o from a .f90 file
%.o: %.f90
	$(FCOMP) $(FFLAGS) -c $<

# rule to make a .o from a .cxx file
%.o: %.cxx
	$(COMP) $(CFLAGS) -c $<

# rule to build the main target
main: $(objects)
	$(COMP) -o main $(objects) -lgfortran

# rule to remove intermediate .o and .mod files
clean:
	rm -f *.o *.mod

.PHONY: clean
