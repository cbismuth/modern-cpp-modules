#include "include/calculator.h"

#include "calculator.private.h"

int sum(const int first, const int second) {
    return sumInner(first, second);
}

int sumInner(const int first, const int second) {
    return first + second;
}
