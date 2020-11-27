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
//中序遍历 二叉搜索树 成有序数组
class Solution {
    var res = 0
    var rank = 0
    
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        kthSmallestHelp(root,k)
        return res
       
    }
    func kthSmallestHelp(_ root: TreeNode?, _ k: Int)  {
        if root  == nil {
            return
        }
        kthSmallestHelp(root?.left, k)
        rank += 1
        if rank == k {
            res = root!.val
        }
        kthSmallestHelp(root?.right, k)
    }
}
