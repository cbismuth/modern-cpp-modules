#include "gtest/gtest.h"

TEST(learncpp_variables, copy_initialization) {
    int a;
    a = 42;
    EXPECT_EQ(a, 42);
}

TEST(learncpp_variables, direct_initialization) {
    int a(42);
    EXPECT_EQ(a, 42);
}

TEST(learncpp_variables, uniform_initialization) {
    int a{42};
    EXPECT_EQ(a, 42);
}

TEST(learncpp_variables, uniform_initialization_with_0) {
    int a{};
    EXPECT_EQ(a, 0);
}
