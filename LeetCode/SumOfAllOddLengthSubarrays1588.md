**Date:** 03-11-2026

## Problem Solved

| No. | Problem | LeetCode | Difficulty | Topic |
|---|---|---|---|---|
| 4 | Sum of All Odd Length Subarrays | #1588 | Easy | Array / Contribution Technique |

---

## Problem 4: Sum of All Odd Length Subarrays

**LeetCode:** #1588  
**Difficulty:** Easy  
**Topic:** Array, Contribution Technique

### Approach

- Instead of generating all possible subarrays, calculate how many odd-length subarrays contain each element.
- For every element at index `i`:
  - Number of choices on the left = `i + 1`.
  - Number of choices on the right = `n - i`.
- Total subarrays containing the element = `(i + 1) * (n - i)`.
- Approximately half of these subarrays have odd lengths.
- If the total number is odd, the number of odd-length subarrays is `(total + 1) / 2`.
- Otherwise, it is `total / 2`.
- Multiply the number of odd-length subarrays by the current element and add it to `ans`.

### Solution

```cpp
class Solution {
public:
    int sumOddLengthSubarrays(vector<int>& arr) {
        int ans = 0;
        int n = arr.size();

        for(int i = 0; i < arr.size(); i++) {
            if(arr.size() % 2 != 0 && i % 2 == 0) {
                ans = ans + (((((i+1)*(n-i))+1)/2)*arr[i]);
            }
            else {
                ans = ans + ((((i+1)*(n-i))/2)*arr[i]);
            }
        }

        return ans;
    }
};
```

### Key Learning

**Contribution Technique**

- Instead of calculating every subarray, calculate how many valid subarrays contain each element.
- Left choices = `i + 1`.
- Right choices = `n - i`.
- Total occurrences = `(i + 1) * (n - i)`.
- If the total is odd, odd-length subarrays get one extra occurrence.

**Formula:**

`Contribution = Number of Odd Subarrays Containing arr[i] * arr[i]`

### Complexity Analysis

- **Time Complexity:** O(n) – Traverses the array once.
- **Space Complexity:** O(1) – Uses only a few variables without extra arrays.

### Important Note

The condition `arr.size() % 2 != 0 && i % 2 == 0` identifies when the total number of subarrays containing the current element is odd.

In that case, the number of odd-length subarrays is `(total + 1) / 2`; otherwise, it is `total / 2`.
