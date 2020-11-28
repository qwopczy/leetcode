/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

 private class TreeNode {
     public var val: Int
     public var left: TreeNode?
     public var right: TreeNode?
     public init(_ val: Int) {
         self.val = val
         self.left = nil
         self.right = nil
     }
 }
//递归
class Solution104 {
   private func maxDepth(_ root: TreeNode?) -> Int {
        if root == nil  {
            return 0
        }
        var left = maxDepth(root?.left)
        var right = maxDepth(root?.right)
        return left > right ? left+1 :right + 1
    }
}
