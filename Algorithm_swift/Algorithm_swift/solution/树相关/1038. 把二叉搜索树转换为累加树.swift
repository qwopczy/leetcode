/**
 * Definition for a binary tree node.
 *
 */
class Solution1038 {
    class TreeNode {
        public var val: Int
        public var left: TreeNode?
        public var right: TreeNode?
        public init() { self.val = 0; self.left = nil; self.right = nil; }
        public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
        public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
            self.val = val
            self.left = left
            self.right = right
        }
    }
    // 记录累加和
    var sum = 0
    func bstToGst(_ root: TreeNode?) -> TreeNode? {
        bstToGstHelp(root)
        return root
    }
    func bstToGstHelp(_ root: TreeNode?) {
        if root == nil {
            return
        }
        bstToGstHelp(root?.right)
         // 维护累加和 右边的大于中间的 右中左为 降序
        sum += root!.val
        // 将 BST 转化成累加树
        root!.val = sum
        bstToGstHelp(root?.left)
    }
}
