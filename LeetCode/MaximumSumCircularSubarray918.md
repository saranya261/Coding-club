**Date:** 10-11-2026

## Problem Solved

| No. | Problem | LeetCode | Difficulty | Topic |
| --- | ------- | -------- | ---------- | ----- |
| 7 | Maximum Sum Circular Subarray | #918 | Medium | Array / Kadane's Algorithm |

---

## Problem 7: Maximum Sum Circular Subarray

**LeetCode:** #918  
**Difficulty:** Medium  
**Topic:** Array, Kadane's Algorithm, Circular Array

### Approach

- Initialize variables to track:
  - `currsum` – Current maximum subarray sum.
  - `maxsum` – Maximum subarray sum found so far.
  - `mincurrsum` – Current minimum subarray sum.
  - `minsum` – Minimum subarray sum found so far.
  - `totalsum` – Total sum of the array.
- Traverse the array starting from index 1.
- Update `totalsum` by adding the current element.
- Apply Kadane's Algorithm to find the maximum subarray sum:
  - Either extend the previous subarray or start a new subarray.
  - Update `maxsum` whenever a larger sum is found.
- Apply the minimum subarray version of Kadane's Algorithm:
  - Either extend the previous minimum subarray or start a new one.
  - Update `minsum` whenever a smaller sum is found.
- Calculate the maximum circular subarray sum using:

  `Circular Sum = Total Sum - Minimum Subarray Sum`

- Compare the normal maximum subarray sum with the circular sum and return the larger value.

### Solution

```cpp
class Solution {
public:
    int maxSubarraySumCircular(vector<int>& nums) {
        int currsum, maxsum;
        currsum = nums[0];
        maxsum = nums[0];

        int minsum = nums[0];
        int mincurrsum = nums[0];
        int totalsum = nums[0];

        for(int i = 1; i < nums.size(); i++) {
            totalsum = totalsum + nums[i];

            if(currsum + nums[i] > nums[i]) {
                currsum = currsum + nums[i];
            }
            else {
                currsum = nums[i];
            }

            if(mincurrsum + nums[i] > nums[i]) {
                mincurrsum = nums[i];
            }
            else {
                mincurrsum = mincurrsum + nums[i];
            }

            if(mincurrsum < minsum) {
                minsum = mincurrsum;
            }

            if(currsum > maxsum) {
                maxsum = currsum;
            }
        }

        if(maxsum < 0) return maxsum;

        return max(maxsum, totalsum - minsum);
    }
};
```

### Key Learning

**Kadane's Algorithm – Maximum and Minimum Subarray**

- Maximum Kadane's Algorithm finds the maximum sum of a continuous subarray.
- Minimum Kadane's Algorithm finds the minimum sum of a continuous subarray.
- In a circular array, the maximum subarray can wrap around the end and beginning.
- Instead of directly finding the circular subarray, subtract the minimum subarray sum from the total array sum.

**Important Formulas:**

`Maximum Circular Sum = Total Sum - Minimum Subarray Sum`

`Answer = max(Maximum Subarray Sum, Total Sum - Minimum Subarray Sum)`

### Complexity Analysis

- **Time Complexity:** O(n) – The array is traversed once, updating all sums in the same loop.
- **Space Complexity:** O(1) – Only a constant number of variables are used.

### Important Note

- If all elements are negative, return `maxsum` directly.
- Otherwise, `totalsum - minsum` would become 0 because the minimum subarray could be the entire array, which is not a valid non-empty circular subarray.
- This solution combines normal Kadane's Algorithm with its minimum-subarray variation to handle circular subarrays efficiently.
