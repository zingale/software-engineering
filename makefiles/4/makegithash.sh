#/bin/sh

HASH=`git rev-parse HEAD`

cat > githash.cpp <<EOF
#include <string>

std::string gitstuff() {

  std::string hash = "${HASH}";

  return hash;
}
EOF


