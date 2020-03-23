#include "include/dummy.h"

#include "dummy.private.h"

int sum_inner(const int first, const int second) {
  return first + second;
}

int sum(const int first, const int second) {
  return sum_inner(first, second);
}
