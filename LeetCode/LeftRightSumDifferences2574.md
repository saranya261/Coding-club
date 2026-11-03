**Date:** 03-11-2026

## Problem Solved

| No. | Problem | LeetCode | Difficulty | Topic |
|---|---|---|---|---|
| 3 | Left and Right Sum Differences | #2574 | Easy | Array / Prefix Sum |

---

## Problem 3: Left and Right Sum Differences

**LeetCode:** #2574  
**Difficulty:** Easy  
**Topic:** Array, Prefix Sum

### Approach

- Create three vectors: `leftSum`, `rightSum`, and `ans`.
- Initialize `leftSum[0] = 0` because there are no elements to the left of the first index.
- Calculate the left prefix sum by adding the previous element to the previous left sum.
- Initialize `rightSum[n-1] = 0` because there are no elements to the right of the last index.
- Traverse backwards to calculate the right sum.
- Calculate the absolute difference between the left sum and right sum at every index.
- Store the result in the answer vector and return it.

### Solution

```cpp
class Solution {
public:
    vector<int> leftRightDifference(vector<int>& nums) {
        vector<int> leftSum(nums.size());
        vector<int> rightSum(nums.size());
        vector<int> ans(nums.size());

        leftSum[0] = 0;

        for(int i = 1; i < nums.size(); i++) {
            leftSum[i] = leftSum[i-1] + nums[i-1];
        }

        rightSum[nums.size()-1] = 0;

        for(int i = nums.size()-2; i >= 0; i--) {
            rightSum[i] = rightSum[i+1] + nums[i+1];
        }

        for(int i = 0; i < nums.size(); i++) {
            ans[i] = abs(leftSum[i] - rightSum[i]);
        }

        return ans;
    }
};
```

### Key Learning

**Prefix Sum – Left and Right Traversal**

- Left Sum → Sum of all elements before the current index.
- Right Sum → Sum of all elements after the current index.
- First index has a left sum of `0`.
- Last index has a right sum of `0`.
- `abs()` → Returns the absolute (non-negative) difference between two values.

**Formula:**

`Answer[i] = abs(LeftSum[i] - RightSum[i])`

### Complexity Analysis

- **Time Complexity:** O(n) – Three traversals of the array.
- **Space Complexity:** O(n) – Three additional vectors are used.

### Important Note

The current element is excluded from both left sum and right sum. This is why the loops use `nums[i-1]` and `nums[i+1]`.
