**Date:** 12-11-2026

## Problems Solved

| No. | Problem | LeetCode | Difficulty | Topic |
| --- | ------- | -------- | ---------- | ----- |
| 9 | Find Missing Elements | #3731 | Easy | Array / Hash Set |

---

## Problem 9: Find Missing Elements

**LeetCode:** #3731  
**Difficulty:** Easy  
**Topic:** Array, Hash Set, `unordered_set`

### Approach

- Create an empty vector `ans` to store the missing elements.
- Create an `unordered_set` using the elements of the input array.
  - This allows us to check whether an element exists in average O(1) time.
- Find the minimum and maximum elements using `min_element()` and `max_element()`.
- Traverse the range from the minimum element to the maximum element.
- For every number:
  - Use `st.find()` to check whether it exists in the set.
  - If it does not exist, add it to the answer vector.
- Return the answer vector.

### Solution

```cpp
class Solution {
public:
    vector<int> findMissingElements(vector<int>& nums) {

        vector<int> ans;
        unordered_set<int> st(nums.begin(), nums.end());

        int mini = *min_element(nums.begin(), nums.end());
        int maxi = *max_element(nums.begin(), nums.end());

        for(int i = 0; i < maxi - mini; i++) {
            if(st.find(mini + i) == st.end()) {
                ans.push_back(mini + i);
            }
        }

        return ans;
    }
};
```

### Key Learning

**Hash Set – Fast Element Lookup**

- `unordered_set` stores unique elements.
- `st(nums.begin(), nums.end())` initializes the set with all elements from the vector.
- `st.find(element)` checks whether an element exists in the set.
- `st.end()` represents the position after the last element.
- If `st.find(element) == st.end()`, the element is not present.

**Important Functions:**

- `min_element()` → Finds the smallest element.
- `max_element()` → Finds the largest element.
- `unordered_set` → Provides average O(1) search time.

### Complexity Analysis

Let `n` be the number of elements and `R = maxi - mini`.

- **Time Complexity:** O(n + R) average case – Finding minimum and maximum and constructing the set take O(n). Checking all values in the range takes O(R) average time.
- **Space Complexity:** O(n + k) – The set stores up to n elements and the answer vector stores k missing elements.

### Important Note

- The loop runs from `mini` to `maxi - 1` because the maximum element is already present in the array.
- `unordered_set` avoids repeatedly searching the original array.
- The range-based traversal is efficient when the difference between the maximum and minimum values is reasonably small.
