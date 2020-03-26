#include "dummy.h"

#include "gtest/gtest.h"

TEST(dummy, sum) {
    EXPECT_EQ(sum(40, 2), 42);
}
