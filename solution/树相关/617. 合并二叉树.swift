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
/**
 *给定两个二叉树，想象当你将它们中的一个覆盖到另一个上时，两个二叉树的一些节点便会重叠。

 你需要将他们合并为一个新的二叉树。合并的规则是如果两个节点重叠，那么将他们的值相加作为节点合并后的新值，否则不为 NULL 的节点将直接作为新二叉树的节点。

 
 */
class Solution {
    func mergeTrees(_ t1: TreeNode?, _ t2: TreeNode?) -> TreeNode? {
        if t2 == nil {
            return t1
        } else if t1 == nil {
            return t2
        }
        
        
        let val = t1!.val  +  t2!.val
        
        let node = TreeNode(val)
        node.left =  mergeTrees(t1?.left, t2?.left)
        node.right =  mergeTrees(t1?.right, t2?.right)
        
        return node
    }
}
