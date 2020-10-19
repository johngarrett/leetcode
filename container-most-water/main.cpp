#include <iostream>
#include <vector>
#include <algorithm>

int maxArea(std::vector<int>& height) {
    int max_area = 0;

    /* c++ sucks...
      for (auto [i, lhs]: std::enumerate(height)) {
        for (auto [j, rhs]: std::enumerate(height.after(index))) {
            auto area = std::min(lhs, rhs) * (j - i);

            std::cout << area << std::endl;
            if (area > maxArea) {
                maxArea = area;
            }
        }
    }
    */

    for(auto i = 0; i < height.size(); i++) {
        auto lhs_height = height.at(i);
        for(auto j = i; j < height.size(); j++) {
            auto h = std::min(lhs_height, height.at(j));
            auto area = h * (j - i);
            std::cout << area << std::endl;
            if (area > max_area) {
               max_area = area;
            }
        }
    }
    return max_area;
}

int main() {
    std::vector<int> input {1, 8, 6, 2, 5, 4, 8, 3, 7};
    std::cout << maxArea(input); 
    return 0;
}
