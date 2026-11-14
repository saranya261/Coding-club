# Third Maximum Number

**Date:** 14-11-2026

## WORST PROBLEM SPENT SOOO MUCH TIME I DUNNO WHY

## Problems Solved

| No. | Problem | LeetCode | Difficulty | Topic |
|---|---|---|---|---|
| 11 | Third Maximum Number | #414 | Easy | Array / Top-K Tracking |

## Problem 1: Third Maximum Number

**LeetCode:** #414  
**Difficulty:** Easy  
**Topic:** Array, Top-K Tracking, Distinct Elements

### Approach

Maintain three variables to store the first, second, and third distinct maximum elements:

- `fmax` – First maximum
- `smax` – Second maximum
- `tmax` – Third maximum

Use three flags (`flag1`, `flag2`, `flag3`) to indicate whether each maximum has been initialized. This helps handle `INT_MIN` correctly.

Traverse the array and update the maximum values based on the following conditions:

1. If the current element is greater than the first maximum:
   - Shift the second maximum to the third maximum.
   - Shift the first maximum to the second maximum.
   - Update the first maximum with the current element.

2. If the current element is smaller than the first maximum but greater than the second maximum (or the second maximum is not initialized):
   - Shift the second maximum to the third maximum if it exists.
   - Update the second maximum.

3. If the current element is smaller than the second maximum but greater than the third maximum (or the third maximum is not initialized):
   - Update the third maximum.

Strict comparison operators ensure that duplicate elements are ignored.

After traversing the array:
- If the third maximum exists, return it.
- Otherwise, return the first maximum.

### Solution

```cpp
class Solution {
public:
    int thirdMax(vector<int>& nums) {
        int fmax = INT_MIN;
        int smax = INT_MIN;
        int tmax = INT_MIN;

        int flag1 = 0, flag2 = 0, flag3 = 0;

        for (int i = 0; i < nums.size(); i++) {

            if (flag1 == 0 || nums[i] > fmax) {
                if (flag1 == 0) {
                    fmax = nums[i];
                    flag1 = 1;
                }
                else {
                    tmax = smax;
                    flag3 = flag2;

                    smax = fmax;
                    flag2 = 1;

                    fmax = nums[i];
                }
            }

            else if (nums[i] < fmax && (flag2 == 0 || nums[i] > smax)) {
                if (flag2 == 1) {
                    tmax = smax;
                    flag3 = 1;
                }

                smax = nums[i];
                flag2 = 1;
            }

            else if (nums[i] < smax && (flag3 == 0 || nums[i] > tmax)) {
                tmax = nums[i];
                flag3 = 1;
            }
        }

        if (flag3 == 1) return tmax;
        return fmax;
    }
};
```

### Key Learning

**Top-K Tracking – Maintaining the Largest K Elements**

- Top-K Tracking involves maintaining the K largest elements while traversing an array.
- Three variables can maintain the largest, second-largest, and third-largest distinct elements without sorting.
- Strict comparisons (`>`, `<`) prevent duplicate values from being considered separate maximums.
- Flags help distinguish between an uninitialized maximum and a valid `INT_MIN` value.
- Variable shifting moves previously stored maximums when a larger element is found.

**Important Concepts:**

- `INT_MIN` → Represents the smallest possible integer.
- `flag1`, `flag2`, `flag3` → Track whether maximum values have been initialized.
- Variable shifting → Moves previously stored maximums to the next position.
- Distinct elements → Duplicate values are not counted separately.
- Top-K Tracking → Maintains the largest K elements efficiently without sorting.

### Complexity Analysis

Let `n` be the number of elements in the input array.

**Time Complexity: O(n)**

- Traverse the array once.
- Each element requires a constant number of comparisons and updates.

**Space Complexity: O(1)**

- Only three maximum variables and three flags are maintained.
- No additional data structure is used.

### Important Note

- The problem asks for the third **distinct** maximum, not the third element after sorting.
- Duplicate elements are ignored using strict comparisons.
- If fewer than three distinct elements exist, return the maximum element.
- Flags are important because `INT_MIN` itself can be a valid array element.
- This approach maintains the top three distinct maximums in a single traversal.
