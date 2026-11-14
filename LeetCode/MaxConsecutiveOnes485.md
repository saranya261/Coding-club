**Date:** 14-11-2026

## Problem Solved

| No. | Problem | LeetCode | Difficulty | Topic |
| --- | ------- | -------- | ---------- | ----- |
| 10 | Max Consecutive Ones | #485 | Easy | Array / Counting |

---

## Problem 1: Max Consecutive Ones

**LeetCode:** #485  
**Difficulty:** Easy  
**Topic:** Array, Counting

### Approach

- Initialize two variables:
  - `count` – Tracks the current consecutive sequence of ones.
  - `ans` – Stores the maximum number of consecutive ones found so far.
- Traverse the array using a loop.
- For every element:
  - If the current element is `1`, increment `count`.
  - Otherwise, reset `count` to `0` because the consecutive sequence is broken.
- After updating `count`, compare it with `ans`.
- If `count` is greater than `ans`, update `ans`.
- Return `ans`.

### Solution

```cpp
class Solution {
public:
    int findMaxConsecutiveOnes(vector<int>& nums) {
        int ans = 0;
        int count = 0;

        for(int i = 0; i < nums.size(); i++) {
            if(nums[i] == 1) {
                count++;
            }
            else {
                count = 0;
            }

            if(ans < count) {
                ans = count;
            }
        }

        return ans;
    }
};
```

### Key Learning

**Array Traversal – Consecutive Counting Technique**

- `count` maintains the length of the current consecutive sequence.
- Whenever a `1` is encountered, increment the count.
- Whenever a `0` is encountered, reset the count to zero.
- `ans` maintains the maximum consecutive count found during traversal.

**Important Logic:**

- If `nums[i] == 1` → `count++`
- If `nums[i] == 0` → `count = 0`
- Update maximum using `ans = max(ans, count)`.

This technique is useful for problems involving consecutive elements or continuous sequences in an array.

### Complexity Analysis

- **Time Complexity:** O(n) – The array is traversed exactly once.
- **Space Complexity:** O(1) – Only two extra variables are used.

### Important Note

- Resetting `count` to zero whenever a `0` is encountered ensures that only consecutive ones are counted.
- Updating `ans` during traversal ensures that the maximum sequence is preserved even when a later zero resets the current count.
- The solution handles arrays containing all zeros, all ones, or a mixture of both.
