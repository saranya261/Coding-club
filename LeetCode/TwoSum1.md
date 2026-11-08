**Date:** 08-11-2026

## Problem Solved

| No. | Problem | LeetCode | Difficulty | Topic |
|---|---|---|---|---|
| 6 | Two Sum | #1 | Easy | Array / Hash Map |

---

## Problem 6: Two Sum

**LeetCode:** #1  
**Difficulty:** Easy  
**Topic:** Array, Hash Map, `unordered_map`

### Approach

- Create an empty `unordered_map` to store array elements along with their indices.
- Traverse the array using a loop.
- For every element, calculate its complement using `target - nums[i]`.
- Check whether the complement already exists in the map using `mp.find()`.
- If it exists:
  - Retrieve the index of the complement.
  - Store both indices in the answer vector.
  - Break the loop.
- Otherwise, insert the current element and its index into the map.
- Return the answer vector.

### Solution

```cpp
class Solution {
public:
    vector<int> twoSum(vector<int>& nums, int target) {
        vector<int> ans;
        unordered_map<int,int> mp;

        for(int i = 0; i < nums.size(); i++) {
            if(mp.find(target - nums[i]) != mp.end()) {
                ans.push_back(mp[target - nums[i]]);
                ans.push_back(i);
                break;
            }
            else {
                mp.insert({nums[i], i});
            }
        }

        return ans;
    }
};
```

### Key Learning

**Hash Map – Complement Technique**

- `unordered_map` stores elements as key-value pairs.
- Key → Array element.
- Value → Index of that element.
- `mp.find(key)` → Checks whether a key exists in the map.
- `mp.end()` → Represents the position after the last element.
- `mp.insert({nums[i], i})` → Inserts the element and its index.

**Important Formula:**

`Complement = Target - Current Element`

Instead of searching the entire array for the required complement, use a hash map to find it efficiently.

### Complexity Analysis

- **Time Complexity:** O(n) average case – Traverses the array once, with average O(1) hash map operations.
- **Space Complexity:** O(n) – The hash map can store up to n elements.

### Important Note

- Check for the complement before inserting the current element. This prevents using the same array element twice.
- The problem guarantees exactly one solution.
- Using `unordered_map` improves the solution from O(n²) brute force to O(n) average time complexity.
