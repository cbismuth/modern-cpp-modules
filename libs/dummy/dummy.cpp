#include "include/dummy.h"

#include "dummy.private.h"

int sumInner(const int first, const int second) {
  return first + second;
}

int sum(const int first, const int second) {
  return sumInner(first, second);
}
