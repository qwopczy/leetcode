/**
 Definition for a binary tree node.
 public
 */

class Solution235 {
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

    
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        
        /* 递归 二叉查找树
        if  root!.val > p!.val && root!.val > q!.val {
            return lowestCommonAncestor(root?.left, p, q)
        }
        else if root!.val < p!.val && root!.val < q!.val {
            return lowestCommonAncestor(root?.right, p, q)
        }
        return root
        */
        // 遍历
        while root != nil {
            if  root!.val > p!.val && root!.val > q!.val {
                return lowestCommonAncestor(root?.left, p, q)
            
            }else if root!.val < p!.val && root!.val < q!.val {
                return lowestCommonAncestor(root?.right, p, q)
            }else{
                return root
                
            }
        }
        return root
    }
}
