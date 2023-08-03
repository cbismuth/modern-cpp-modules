#include <iostream>

#include "config.h"

int main(int argc, char** argv) {
    if (argc < 2) {
        std::cout << argv[0] << " Version " << C_PROJECT_VERSION << std::endl;
    }

    return 0;
}
