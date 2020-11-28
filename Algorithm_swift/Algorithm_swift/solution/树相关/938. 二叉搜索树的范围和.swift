/**
 * Definition for a binary tree node.
 * public
 */
class Solution938 {
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

    func rangeSumBST(_ root: TreeNode?, _ L: Int, _ R: Int) -> Int {
        if root == nil {
            return 0
        }
        
        if root!.val >= L && root!.val <= R
        {
            return root!.val + rangeSumBST(root!.left, L, R) + rangeSumBST(root!.right, L, R)
        }
        else if root?.val ?? 0 > R {
          return rangeSumBST(root!.left, L, R)
        }
        else   {//root?.val ?? 0 < L
          return rangeSumBST(root!.right, L, R)
        }
    }
}
