 # LeetCode - Day 01

**Date:** 15-09-2026

## Problems Solved

| No. | Problem            | LeetCode | Difficulty | Topic                   |
| --- | ------------------ | -------- | ---------- | ----------------------- |
| 1   | Invert Binary Tree | #226     | Easy       | Binary Tree / Recursion |

---

## Problem 1: Invert Binary Tree

**LeetCode:** #226
**Difficulty:** Easy
**Topic:** Binary Tree, Recursion

### Approach

* If the root is `NULL`, return `NULL`.
* Swap the left and right child of every node.
* Recursively invert the left and right subtrees.
* Return the root of the inverted tree.
* See if you swap a node ,it will be swapped along with its children
* Once dry run it to understand

### Solution

```cpp
class Solution {
public:
    TreeNode* invertTree(TreeNode* root) {
        if(root == NULL){
            return NULL;
        }

        swap(root->left, root->right);

        invertTree(root->left);
        invertTree(root->right);

        return root;
    }
};
```

### Key Learning

**At every node → swap left and right → recursively do the same for its children.**
