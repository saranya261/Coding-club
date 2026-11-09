**Date:** 10-11-2026

## Problem Solved

| No. | Problem | LeetCode | Difficulty | Topic |
| --- | ------- | -------- | ---------- | ----- |
| 7 | Find Pivot Index | #724 | Easy | Array / Prefix Sum |

---

## Problem 7: Find Pivot Index

**LeetCode:** #724  
**Difficulty:** Easy  
**Topic:** Array, Prefix Sum

### Approach

- Initialize two variables, `left` and `right`, to maintain the sums on both sides of the current index.
- Calculate the initial right sum by adding all elements except the first element.
- Traverse the array using a loop.
- For every index:
  - Check whether `left == right`.
  - If both sums are equal, return the current index as the pivot index.
  - Otherwise, add the current element to `left`.
  - Subtract the next element from `right` to update the right sum for the next iteration.
- If no pivot index is found, return `-1`.

### Solution

```cpp
class Solution {
public:
    int pivotIndex(vector<int>& nums) {
        int left = 0;
        int right = 0;

        for(int i = 1; i < nums.size(); i++) {
            right = right + nums[i];
        }

        for(int i = 0; i < nums.size(); i++) {
            if(left == right) {
                return i;
            }

            if(i == nums.size() - 1) {
                left = left + nums[i];
                right = 0;
            }
            else {
                left = left + nums[i];
                right = right - nums[i + 1];
            }
        }

        return -1;
    }
};
```

### Key Learning

**Prefix Sum – Running Sum Technique**

- `left` → Stores the sum of elements before the current index.
- `right` → Stores the sum of elements after the current index.
- Compare both sums at every index to identify the pivot index.
- Update the sums while traversing instead of calculating them repeatedly.

**Important Condition:**

`Left Sum == Right Sum`

A pivot index is the position where the sum of all elements to its left equals the sum of all elements to its right.

### Complexity Analysis

- **Time Complexity:** O(n) – The array is traversed twice to calculate and update the sums.
- **Space Complexity:** O(1) – Only two variables are used, requiring constant extra space.

### Important Note

- The current element is not included in either the left sum or the right sum.
- At the last index, the right sum is zero because there are no elements after it.
- The solution avoids repeatedly calculating subarray sums by maintaining running sums.
