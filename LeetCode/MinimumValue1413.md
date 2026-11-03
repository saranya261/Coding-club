**Date:** 03-11-2026

## Problems Solved

| No. | Problem | LeetCode | Difficulty | Topic |
|---|---|---|---|---|
| 2 | Minimum Value to Get Positive Step by Step Sum | #1413 | Easy | Array / Prefix Sum |

---

## Problem 2: Minimum Value to Get Positive Step by Step Sum

**LeetCode:** #1413  
**Difficulty:** Easy  
**Topic:** Array, Prefix Sum

### Approach

- Calculate the prefix sum of the array.
- Start traversing from index `1`.
- Add the previous element (prefix sum) to the current element.
- Find the minimum prefix sum using the inbuilt `min_element()` function.
- If the minimum prefix sum is greater than or equal to `1`, return `1`.
- Otherwise, return `1 - mini` to ensure that every step-by-step sum remains positive.

### Solution

```cpp
class Solution {
public:
    int minStartValue(vector<int>& nums) {
        for(int i = 1; i < nums.size(); i++) {
            nums[i] = nums[i-1] + nums[i];
        }

        int mini = *min_element(nums.begin(), nums.end());

        if(mini >= 1) return 1;

        return 1 - mini;
    }
};
```

### Key Learning

**Prefix Sum + Minimum Element**

- Prefix Sum → Stores the cumulative sum of elements.
- `min_element()` → Finds the smallest element in a range.
- `*min_element(nums.begin(), nums.end())` → Returns the actual minimum value.
- The minimum starting value depends on the smallest prefix sum.

**Formula:**

`Minimum Start Value = max(1, 1 - Minimum Prefix Sum)`

### Complexity Analysis

- **Time Complexity:** O(n) – One traversal for prefix sum and one for finding the minimum element.
- **Space Complexity:** O(1) – Modifies the original array without using extra space.

### Important Note

- `min_element()` is an inbuilt C++ function available in the `<algorithm>` header.
- It returns an iterator, so use `*` to access the actual minimum value.
- This solution modifies the original `nums` array while calculating prefix sums.
