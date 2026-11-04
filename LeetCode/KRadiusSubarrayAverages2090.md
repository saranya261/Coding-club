**Date:** 04-11-2026

## Problem Solved

| No. | Problem | LeetCode | Difficulty | Topic |
|---|---|---|---|---|
| 5 | K Radius Subarray Averages | #2090 | Medium | Array / Sliding Window |

---

## Problem 5: K Radius Subarray Averages

**LeetCode:** #2090  
**Difficulty:** Medium  
**Topic:** Array, Sliding Window

### Approach

- Create an answer vector of size `n`, initialized with `-1`.
- Calculate the window size using `2*k + 1`.
- If the array size is smaller than the window size, return the answer vector.
- Calculate the sum of the first window containing `2*k + 1` elements.
- Find its average and store it at index `k`.
- Slide the window one position at a time:
  - Add the new element entering the window.
  - Subtract the element leaving the window.
- Calculate the new average and store it at the corresponding center index.
- Return the answer vector.

### Solution

```cpp
class Solution {
public:
    vector<int> getAverages(vector<int>& nums, int k) {
        int n = nums.size();
        vector<int> ans(n, -1);

        if (n < 2*k + 1) return ans;

        long long sum = 0;

        // Calculate first window
        for (int i = 0; i < 2*k + 1; i++) {
            sum += nums[i];
        }

        ans[k] = sum / (2*k + 1);

        // Slide the window
        for (int i = 1; i <= n - (2*k + 1); i++) {
            sum += nums[i + 2*k];
            sum -= nums[i - 1];

            ans[k + i] = sum / (2*k + 1);
        }

        return ans;
    }
};
```

### Key Learning

**Sliding Window Technique**

- Calculate the first window sum.
- Instead of recalculating the sum for every window, reuse the previous window sum.
- Add the incoming element.
- Remove the outgoing element.
- Calculate the average using the updated sum.

**Formula:**

`New Window Sum = Previous Window Sum + Incoming Element - Outgoing Element`

`Average = Window Sum / Window Size`

### Complexity Analysis

- **Time Complexity:** O(n) – First window takes O(k), and sliding through the remaining windows takes O(n).
- **Space Complexity:** O(n) – The answer vector requires O(n) space; the sliding window itself uses O(1) extra space.

### Important Notes

- Initialize the answer vector with `-1` because indices without a complete K-radius window must contain `-1`.
- Use `long long` for the window sum to prevent integer overflow.
- The center of the first valid window is at index `k`.
- Integer division automatically removes the decimal part of the average.
- The solution also handles `k = 0`, where each element is its own average.
