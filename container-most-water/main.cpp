#include <iostream>
#include <vector>
#include <algorithm>

int maxArea(std::vector<int>& height) {
    int lhs = 0, rhs = height.size() - 1, max_area = 0;
    /*
     * start from both ends, move together until equal
     */

    while (lhs < rhs) { 
        auto area = std::min(height.at(lhs), height.at(rhs)) * (rhs - lhs);
        max_area = std::max(max_area, area);

        // if lhs height < rhs height, move forward to try and find a higher height
        if (height.at(lhs) < height.at(rhs)) {
            ++lhs;
        } else {
            --rhs;
        }
    }

    return max_area;
}

int main() {
    std::vector<int> input {1, 8, 6, 2, 5, 4, 8, 3, 7};
    std::cout << maxArea(input); 
    return 0;
}
