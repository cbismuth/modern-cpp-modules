#include "gtest/gtest.h"

#include "dummy.h"

TEST(dummy, sum) {
    EXPECT_EQ(sum(40, 2), 42);
}
