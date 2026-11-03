**Date:** 03-11-2026

## Problems Solved

| No. | Problem | LeetCode | Difficulty | Topic |
|---|---|---|---|---|
| 1 | Majority Element | #169 | Easy | Array / Boyer-Moore Voting Algorithm |

---

## Problem 1: Majority Element

**LeetCode:** #169  
**Difficulty:** Easy  
**Topic:** Array, Boyer-Moore Voting Algorithm

### Approach

- Initialize `count = 1` and `major = nums[0]`.
- Traverse the array starting from index `1`.
- If `count == 0`, select the current element as the new majority candidate.
- If the current element equals `major`, increment `count`.
- Otherwise, decrement `count`.
- Return `major` after traversing the array.

### Solution

```cpp
class Solution {
public:
    int majorityElement(vector<int>& nums) {
        int count = 1;
        int major = nums[0];

        for(int i = 1; i < nums.size(); i++) {
            if(count == 0) {
                major = nums[i];
            }

            if(nums[i] == major)
                count++;
            else
                count--;
        }

        return major;
    }
};
```

### Key Learning

**Boyer-Moore Voting Algorithm**

- Same element → Increment count.
- Different element → Decrement count.
- Count becomes zero → Choose a new candidate.
- The majority element appears more than `n/2` times, so it remains the final candidate.

### Complexity Analysis

- **Time Complexity:** O(n) – Traverses the array once.
- **Space Complexity:** O(1) – Uses constant extra space.

### Important Note

The problem guarantees that a majority element exists, so an additional verification step is not required.
