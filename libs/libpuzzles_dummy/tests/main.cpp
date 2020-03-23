#include <iostream>

#include <../include/dummy.h>

int main(const int argc, const char **argv) {
    std::cout << "Running tests ..." << "\n";

    return 42 == sum(40, 2) ? 0 : 1;
}
