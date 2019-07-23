#include <iostream>

#include "make_example.H"
#include "githash.H"

int main() {

  double x, y, z;

  x = 1.0;
  y = 2.0;

  compute(x, y, z);

  print_result(z);

  std::cout << "code version " << gitstuff() << std::endl;
}

