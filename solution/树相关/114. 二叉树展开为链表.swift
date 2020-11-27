/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func flatten(_ root: TreeNode?) {
        // base case
        guard var root  = root else {
            return
        }
        flatten(root.left)
        flatten(root.right)
   /**** 后序遍历位置 ****/
    // 1、左右子树已经被拉平成一条链表
        var rightTmp = root.right
        root.right = root.left
        // 2、将左子树作为右子树
        root.left = nil

// 3、将原先的右子树接到当前右子树的末端
        var last = root
        while last.right is TreeNode {
            last = last.right!
        }

        last.right = rightTmp



    }
}
