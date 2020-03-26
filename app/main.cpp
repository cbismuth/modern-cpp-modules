#include <iostream>

#include "config.h"

int main(int argc, char** argv) {
    if (argc < 2) {
        std::cout << argv[0] << " Version " << PUZZLES_VERSION << std::endl;
    }

    return 0;
}
