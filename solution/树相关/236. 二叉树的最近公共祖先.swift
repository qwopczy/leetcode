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

class Solution {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        if root == nil {
            return nil
        }
        // 二叉树为空或者结点 p/q 为根结点
        if (p === root) || (q === root) {
            return root
        }
        let left = lowestCommonAncestor(root?.left, p, q)
        let right = lowestCommonAncestor(root?.right, p, q)
        /* 结点 p/q 不在左子树中，就在右子树中查找，如果能找到，就返回在右子树中找到的结点（反之亦然） */
        /* 结点 p/q 分别存在左右两颗子树， 根结点为最近公共祖先 */
        /* 结点 p/q 在左右子树都找不到，则它们没有最近公共祖先 */
        return left == nil ? right : right == nil ? left : root
        // if left == nil {
        //     return right
        // }else if right == nil{
        //     return left
        // }
        // return left
        
    }
}
