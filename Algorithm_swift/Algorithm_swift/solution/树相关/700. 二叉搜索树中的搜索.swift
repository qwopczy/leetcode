/**
 * Definition for a binary tree node.
 *
 */
/**
 *给定二叉搜索树（BST）的根节点和一个值。 你需要在BST中找到节点值等于给定值的节点。 返回以该节点为根的子树。 如果节点不存在，则返回 NULL。


 */
class Solution700 {
    class TreeNode {
        public var val: Int
        public var left: TreeNode?
        public var right: TreeNode?
        public init(_ val: Int) {
            self.val = val
            self.left = nil
            self.right = nil
        }
    }
    func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        if root == nil {
            return nil
        }
        
        if root!.val == val {
            return root
        }
        else if root!.val > val {
            return searchBST(root?.left, val)
        }
        else {//if root!.val < val
            return searchBST(root?.right, val)
        }
    }
}
